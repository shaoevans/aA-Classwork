require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    cols = DBConnection.execute2(<<-SQL).first
      SELECT
        *
      FROM
        #{self.table_name}
      LIMIT
        0
    SQL
    cols.map!(&:to_sym)
    @columns = cols
  end

  def self.finalize!
    self.columns.each do |col|
      define_method(col) do
        self.attributes[col]
      end
      define_method("#{col}=") do |ele|
        self.attributes[col] = ele
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.name.underscore.pluralize
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
    SQL

    parse_all(results)
  end

  def self.parse_all(results)
    results.map {|result| self.new(result)}
  end

  def self.find(id)
    results = DBConnection.execute(<<-SQL, id)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
      WHERE
        id = ?
    SQL
    parse_all(results).first
  end

  def initialize(params = {})
        params.each do |attr_name, value|
      # make sure to convert keys to symbols
      attr_name = attr_name.to_sym
      if self.class.columns.include?(attr_name)
        self.send("#{attr_name}=", value)
      else
        raise "unknown attribute '#{attr_name}'"
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map {|col| self.attributes[col]}
  end

  def insert
    col_names = self.class.columns.join(", ")
    q_marks = ["?"] * self.class.columns.length
    q_marks = q_marks.join(", ")

    DBConnection.execute(<<-SQL, *self.attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{q_marks})
    SQL
    self.send(:id=, DBConnection.last_insert_row_id)
  end


  def update
    setquerry = self.class.columns.map {|col| "#{col} = ?"}
    setquerry = setquerry.join(", ")
    DBConnection.execute(<<-SQL, *self.attribute_values, self.id)
      UPDATE
        #{self.class.table_name}
      SET
        #{setquerry}
      WHERE
        #{self.class.table_name}.id = ?
    SQL
  end

  def save
    if self.id
      self.update
    else
      self.insert
    end
  end
end

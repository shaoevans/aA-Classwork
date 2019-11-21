require_relative '02_searchable'
require 'active_support/inflector'

require "byebug"
# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    @class_name.constantize
  end

  def table_name
    self.model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    f_name = "#{name.to_s}_id".to_sym
    options[:primary_key] ? @primary_key = options[:primary_key] : @primary_key = :id
    options[:foreign_key] ? @foreign_key = options[:foreign_key] : @foreign_key = f_name
    options[:class_name] ? @class_name = options[:class_name] : @class_name = name.to_s.capitalize
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    f_name = "#{self_class_name.to_s.downcase}_id".to_sym
    options[:primary_key] ? @primary_key = options[:primary_key] : @primary_key = :id
    options[:foreign_key] ? @foreign_key = options[:foreign_key] : @foreign_key = f_name
    options[:class_name] ? @class_name = options[:class_name] : @class_name = name.to_s.singularize.capitalize
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
  debugger
    options = BelongsToOptions.new(name, options)
    mclass = options.model_class
    fkey = options.foreign_key
    pkey = options.primary_key
    mclass.where(pkey => fkey).first
  end

  def has_many(name, options = {})
    # ...
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  extend Associatable
end

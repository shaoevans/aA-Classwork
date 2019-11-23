class AddParameters < ActiveRecord::Migration[5.2]
  def change
    add_column :cats, :color, :string, null: false
    add_column :cats, :name, :string, null: false
    add_column :cats, :sex, :string, null: false, limit: 1
    add_column :cats, :description, :text
  end
end

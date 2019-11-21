class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :fname, null: false
      t.string :lname, null: false
      t.timestamps
    end
  end
end

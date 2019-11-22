class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :liked_id, null: false
      t.string :liked_type, null: false
      t.integer :liker_id, null: false
      t.timestamps
    end
    add_index :likes, :liked_id
    add_index :likes, [:liker_id, :liked_id, :liked_type], unique: true
  end
end



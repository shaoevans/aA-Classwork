class CreateObjectives < ActiveRecord::Migration[5.2]
  def change
    create_table :objectives do |t|
      t.integer :author_id, null: false
      t.text :body, null: false
      t.string :title, null: false
      t.timestamps
    end
    add_index :objectives, [:author_id, :title], unique: true
  end
end

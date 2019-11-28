class CreateCheers < ActiveRecord::Migration[5.2]
  def change
    create_table :cheers do |t|
      t.integer :author_id, null: false
      t.integer :objective_id, null: false
      t.timestamps
    end
    add_index :cheers, [:author_id, :objective_id], unique: true
  end
end

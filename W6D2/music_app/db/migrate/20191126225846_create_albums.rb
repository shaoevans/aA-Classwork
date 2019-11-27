class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.integer :band_id, null: false
      t.integer :yr, null: false
      t.string :title, null: false
      t.string :type
      t.timestamps
    end
  end
end

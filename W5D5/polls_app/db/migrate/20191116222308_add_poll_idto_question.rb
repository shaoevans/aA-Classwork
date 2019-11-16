class AddPollIdtoQuestion < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :poll_id, :integer
  end
end

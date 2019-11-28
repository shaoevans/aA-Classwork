class Cheer < ApplicationRecord
  
  validates :author_id, :objective_id, presence: true
  validates_uniqueness_of :objective_id, scope: :author_id
  
  belongs_to :objective

  belongs_to :author,
    class_name: :User

end

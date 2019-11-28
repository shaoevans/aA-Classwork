class Objective < ApplicationRecord
  belongs_to :author,
    class_name: :User

  has_many :cheers

  validates :author_id, :body, :title, presence: true
  validates_uniqueness_of :title, scope: :author_id
  # validates :title, uniqueness: {scope: :author_id}
end

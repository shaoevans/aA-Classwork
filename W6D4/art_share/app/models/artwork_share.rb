class ArtworkShare < ApplicationRecord
  belongs_to :artwork,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Artwork 

  belongs_to :viewer,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :User

  validates :artwork_id, :viewer_id, presence: true
  # validates :viewer_id, uniqueness: {scope: :question_id }
end

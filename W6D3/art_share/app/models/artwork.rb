class Artwork < ApplicationRecord
  validates :title, :image_url, :artist_id, presence: true

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

  has_many :shared_artworks,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare,
    dependent: :destroy

  has_many :comments,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Comment,
    dependent: :destroy

  has_many :likes,
    as: :liked,
    dependent: :destroy

  has_many :shared_viewers,
    through: :shared_artworks,
    source: :viewer
end

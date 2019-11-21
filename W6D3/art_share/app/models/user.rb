class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true


  has_many :artworks,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :Artwork

  has_many :artworks_shares,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare

  has_many :shared_artworks,
    through: :artworks_shares,
    source: :artwork
end

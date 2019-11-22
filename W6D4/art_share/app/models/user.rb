class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  has_many :comments,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :Comment,
    dependent: :destroy

  has_many :artworks,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :Artwork,
    dependent: :destroy

  has_many :artworks_shares,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare,
    dependent: :destroy
  
  has_many :collections,
    primary_key: :id,    
    foreign_key: :owner_id,
    class_name: :Collection,
    dependent: :destroy

  has_many :likes,
    primary_key: :id,
    foreign_key: :liker_id,
    class_name: :Like,
    dependent: :destroy

  has_many :shared_artworks,
    through: :artworks_shares,
    source: :artwork


end

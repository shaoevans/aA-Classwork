class Collection < ApplicationRecord
  belongs_to :owner,
    primary_key: :id,
    foreign_key: :owner_id,
    class_name: :User

  has_many :collection_members,
    primary_key: :id,    
    foreign_key: :collection_id,
    class_name: :CollectionMember

  has_many :artworks,
    through: :collection_members,
    source: :artwork 
end

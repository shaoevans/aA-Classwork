class CollectionMember < ApplicationRecord
  belongs_to :collection,
    primary_key: :id, 
    foreign_key: :collection_id,
    class_name: :Collection 

  belongs_to :artwork,
    primary_key: :id, 
    foreign_key: :artwork_id,
    class_name: :Artwork
end

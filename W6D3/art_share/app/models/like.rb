class Like < ApplicationRecord
  belongs_to :liked,
    polymorphic: true
end

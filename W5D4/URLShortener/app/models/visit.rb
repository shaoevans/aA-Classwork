class Visit < ApplicationRecord
  def self.record_visit!(user, shortened_url)
    
    visit = Visit.new(user_id: user.id,short_url_id: shortened_url.id)
    visit.save!

  end
  belongs_to :visitor,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :visited_url,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :ShortenedUrl

  validates :short_url_id, presence: true
  validates :user_id, presence: true
end

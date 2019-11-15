# t.string "short_url", null: false
#     t.string "long_url", null: false
#     t.integer "user_id", null: false


class ShortenedUrl < ApplicationRecord
  include SecureRandom
  def self.random_code
    new_rand = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(short_url: new_rand)
      new_rand = SecureRandom.urlsafe_base64
    end
    new_rand
  end

  def self.make_short(url, user)
    new_rand = ShortenedUrl.random_code
    ShortenedUrl.new(short_url: new_rand, long_url: url, user_id: user.id)  
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.distinct_visitors
  end
  #DO WE USE SQL OR RUBY AND HOW TO USE WHERE
  def num_recent_uniques
    # ten_min_ago = DateTime.new( )
    # self.distinct_visitors.where("created_at = ?", ten_min_ago)
  end

  

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :Visit

  has_many :visitors,
    through: :visits,
    source: :visitor

  has_many :distinct_visitors,
    Proc.new { distinct },
    through: :visits,
    source: :visitor
end

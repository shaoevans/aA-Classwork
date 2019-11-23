class Cat < ApplicationRecord
  has_many :cat_rental_requests

  def age
    Time.now.to_s[0..3].to_i - self.birth_date.to_s[0..3].to_i
  end

  validates :color, inclusion: { in: ["black", "brown", "white", "gray", "spotted"], message: "is not a valid color"}
  validates :sex, inclusion: { in: ["M", "F"], message: 'not a valid sex'}
  validates :birth_date, :sex, :color, :name, presence: true
end

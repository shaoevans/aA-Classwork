class CatRentalRequest < ApplicationRecord
  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat,
    dependent: :destroy

  def approve! 
    overlapping = overlapping_pending_requests
    overlapping.each do |request|
      request.deny!
    end
  end

  def deny
    self.status = "DENIED"
  end
  def overlapping_approved_requests
    overlapping_requests.where("status = 'APPROVED'")
  end

  def overlapping_pending_requests
    overlapping_requests.where("status = 'PENDING'").first
  end

  def overlapping_requests
    CatRentalRequest
      .where("cat_id = ?", self.cat_id)
      .where.not("end_date < ? OR start_date > ?", self.start_date, self.end_date)
  end

  validates :status, inclusion: { in: ["PENDING", "APPROVED", "DENIED"], message: 'not a valid status'}
  validates :cat_id, :start_date, :end_date, :status, presence: true
  # validates overlapping_approved_requests.exists?
end


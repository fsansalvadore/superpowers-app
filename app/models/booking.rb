class Booking < ApplicationRecord
  belongs_to :superpower
  belongs_to :rentee, class_name: 'User'
  validates :start_date, :end_date, presence: true
  validate :test_end_date_versus_start_date

  private

  def test_end_date_versus_start_date
    return if end_date.blank? || start_date.blank?
    if end_date <= start_date
      errors.add(:end_date, "is after the start date")
    end
  end
end

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  has_one :review

  validates :end_date, presence: true
  validates :start_date, presence: true
end

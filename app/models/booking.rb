class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  validates :end_date, presence: true
  validates :start_date, presence: true
end

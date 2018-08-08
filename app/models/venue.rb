class Venue < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :category
  belongs_to :user
  has_many :bookings
  validates :address, presence: true
  validates :description, presence: true
  validates :email, presence: true
  validates :email, presence: true
  validates :name, presence: true
end

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

  include PgSearch

  pg_search_scope :global_search,
    against: [ :name, :description ],
    associated_against: {
      category: [ :name ],
      user: [ :first_name, :last_name ]
    },
    using: {
      tsearch: { prefix: true }
    }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

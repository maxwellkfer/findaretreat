class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :bookings
  has_many :venues
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
validates :first_name, presence: true
validates :last_name, presence: true
end

class Listing < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :bookings, dependent: :destroy
end

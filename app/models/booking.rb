class Booking < ApplicationRecord
  belongs_to :listing

  before_destroy :destroy_associated_reservations

  private

  def destroy_associated_reservations
    Reservation.where(listing_id: self.listing_id)
               .where("start_date >= ? AND end_date <= ?", self.start_date, self.end_date)
               .destroy_all
  end
end

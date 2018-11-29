class Reservation < ApplicationRecord
  belongs_to :bike
  belongs_to :user

  def validate!
    self.status = "confirmed"
  end

  def decline!
    self.status = "declined"
  end

  def price
    numberOfDays = (self.ends_at - self.starts_at + 1).to_i
    price = (numberOfDays*bike.price_per_day)/100
  end
end

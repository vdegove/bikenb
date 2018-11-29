class Reservation < ApplicationRecord
  belongs_to :bike
  belongs_to :user

  def validate!
    self.status = "confirmed"
  end

  def decline!
    self.status = "declined"
  end
end

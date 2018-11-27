class Reservation < ApplicationRecord
  belongs_to :bike
  belongs_to :user

  def validate!
    self.status = "confirmed"
  end
end

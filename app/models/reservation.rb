class Reservation < ApplicationRecord
  belongs_to :bike
  belongs_to :user
end

class Bike < ApplicationRecord
  belongs_to :user
  has_many :reservations

  # Photo uploader
  mount_uploader :photo, PhotoUploader
end

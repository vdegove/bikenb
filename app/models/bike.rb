class Bike < ApplicationRecord
  belongs_to :user
  has_many :reservations

  validates :name, presence: true
  validates :address, presence: true
  validates :price_per_day, presence: true, numericality: { only_integer: true }

  # Photo uploader
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

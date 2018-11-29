class Bike < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :price_per_day, presence: true

  # Photo uploader
  mount_uploader :photo, PhotoUploader
end

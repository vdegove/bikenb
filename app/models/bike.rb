class Bike < ApplicationRecord
  belongs_to :user
  has_many :reservations

  validates :name, presence: true
  validates :address, presence: true
  validates :price_per_day, presence: true

  # Photo uploader
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  #PgSearch
  include PgSearch
  pg_search_scope :search_by_category_and_location,
    against: [ :category, :city ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end

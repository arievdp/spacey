class Rocket < ApplicationRecord
  has_many_attached :rocket_images
  belongs_to :user
  has_many :orders
  has_many :reviews, through: :orders
  validates :name, :payload, :price, :description, :location, presence: true
  validates :name, uniqueness: true
  validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 1_000_000 }
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def owner
    # checks who the owner is
    user
  end

  def booked_on?(date)
    # check whether date is included between start and end date (range)
    # receive one date
  end
end

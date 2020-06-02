class Rocket < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many :reviews, through: :orders
  validates :name, :payload, :price, :description, :location, presence: true
  validates :name, uniqueness: true
  validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 1000000 }

  def owner
    # checks who the owner is
    user
  end

  def booked_on?(date)
    # check whether date is included between start and end date (range)
    # receive one date
  end

end

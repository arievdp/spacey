class Order < ApplicationRecord
  belongs_to :rocket
  belongs_to :user
  has_many :reviews
  validates :start_date, :end_date, presence: true
end

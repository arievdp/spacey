class Order < ApplicationRecord
  belongs_to :rocket
  belongs_to :user
  validates :start_date, :end_date, :status, :total_price, presence: true
end

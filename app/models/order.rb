class Order < ApplicationRecord
  belongs_to :rocket
  belongs_to :user
  validates :start_date, :end_date, presence: true
end

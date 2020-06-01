class Review < ApplicationRecord
  belongs_to :order, dependent: :destroy
  validates :rating, presence: true
end

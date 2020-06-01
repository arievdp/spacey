class Review < ApplicationRecord
  belongs_to :order, dependant: :destroy
  validates :rating, prescence: :true
end

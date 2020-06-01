class Review < ApplicationRecord
  belongs_to :order, dependant: :destroy
end

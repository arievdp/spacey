class Order < ApplicationRecord
  belongs_to :rocket
  belongs_to :user
end

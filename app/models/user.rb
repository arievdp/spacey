class User < ApplicationRecord
  has_many :orders
  validates :first_name :last_name :user_name :phone_number, presence: true
  validates :first_name, uniqueness: { scope: :last_name}
  validates :phone_number, format: { with: /^(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}$/ }
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders

  has_many :rockets

  has_many :reviews, through: :orders

  validates :first_name, :last_name, :phone_number, presence: true
  validates :first_name, uniqueness: { scope: :last_name }
  # validates :phone_number, format: { with: /^(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}$/ }
  # error when validationg phone numer: The provided regular expression is using multiline anchors (^ or $), which may present a security risk. Did you mean to use \A and \z, or forgot to add the :multiline => true option? (ArgumentError)
end

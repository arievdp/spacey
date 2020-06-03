class Order < ApplicationRecord
  belongs_to :rocket
  belongs_to :user
  has_many :reviews
  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date?

  def end_date_after_start_date?
    if end_date < start_date
      errors.add :end_date, "must be after start date"
    end
  end
end

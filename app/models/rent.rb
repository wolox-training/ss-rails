class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :start_of_rent, :end_of_rent, presence: true
  scope :on_date, -> { where('? BETWEEN start_of_rent AND end_of_rent', Date.today).where(returned_at: nil) }
  scope :active_rentals, -> { on_date.order('end_of_rent ASC') }
end

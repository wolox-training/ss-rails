class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :start_of_rent, :end_of_rent, presence: true
end

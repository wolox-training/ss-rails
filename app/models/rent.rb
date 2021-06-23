class Rent < ApplicationRecord
  belongs_to :user
  validates :start_of_rent, :end_of_rent, presence: true
end

class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :start_of_rent, :end_of_rent, presence: true
  scope :on_date, -> { where('? BETWEEN start_of_rent AND end_of_rent', Date.today).where(returned_at: nil) }
  scope :active_rentals, -> { on_date.order('end_of_rent ASC') }
  before_create :upload_book, :async_create

  private

  def upload_book
    book_to_update = Book.find(self.book.id)
    book_to_update.times_rented += 1
    book_to_update.save
  end

  def async_create
    RentMailerJob.perform_later(self)
  end
end

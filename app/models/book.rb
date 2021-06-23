class Book < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :title, :year, :author, :image, :editor, :book_genre, presence: true
  has_many :rents, dependent: :destroy
end

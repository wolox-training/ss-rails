class Book < ApplicationRecord
  validates :title, :year, :author, :image, :editor, :book_genre, presence: true
end

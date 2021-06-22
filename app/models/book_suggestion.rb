class BookSuggestion < ApplicationRecord
  belongs_to :user
  validates :title, :year, :author, :link, :editor, presence: true
end

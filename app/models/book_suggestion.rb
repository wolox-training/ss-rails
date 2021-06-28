class BookSuggestion < ApplicationRecord
  belongs_to :user, optional: true
  validates :title, :year, :author, :link, :editor, presence: true
end

class Book < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :title, :year, :author, :image, :editor, :book_genre, presence: true
  has_many :rents, dependent: :destroy
  scope :rents_ranking, -> { joins(:rents).group(:id).order('COUNT(books.id) DESC') }

  Reducer = Rack::Reducer.new(
    self.all,
    ->(author:) { where('lower(author) like ?', "%#{author.downcase}%") },
    ->(genre:) { where('lower(book_genre) like ?', "%#{genre.downcase}%") },
    ->(title:) { where('lower(title) like ?', "%#{title.downcase}%") }
  )
end

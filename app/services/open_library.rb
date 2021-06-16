class OpenLibrary
  require 'faraday'
  require 'json'

  URL = "#{Rails.application.credentials.config[:url]}/books".freeze

  def initialize(isbn)
    @isbn = isbn
    @options = { bibkeys: "ISBN:#{isbn}", format: 'json', jscmd: 'data' }
  end

  def fetch_data
    response = find_book
    response = make_book_hash(response) unless response.empty?
    response
  end

  def find_book
    res = Faraday.get(URL, @options)
    JSON.parse(res.body)
  end

  private

  def make_book_hash(book)
    book = book["ISBN:#{@isbn}"]
           .slice('title', 'subtitle', 'authors', 'number_of_pages')
           .merge('isbn' => @isbn, 'authors' => take_authors(book["ISBN:#{@isbn}"]['authors']))
    book
  end

  def take_authors(authors)
    authors.map { |author| author['name'] }
  end
end

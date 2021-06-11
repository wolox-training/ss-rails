class OpenLibrary
  require 'faraday'
  require 'json'

  def initialize(isbn)
    @isbn = isbn
    @options = { query: { bibkeys: "ISBN:#{isbn}", format: 'json', jscmd: 'data' } }
    @base_url = 'https://openlibrary.org/api'
  end

  def fetch_data
    response = find_book
    unless response.empty?
      response = make_book_hash(response)
    end
    response
  end

  def find_book
    # URL = "#{@BASE_URL}/BOOKS"
    res = Faraday.get("https://openlibrary.org/api/books?bibkeys=ISBN:#{@isbn}&format=json&jscmd=data")
    JSON.parse(res.body)
  end

  private

  def make_book_hash(book)
    book["ISBN:#{@isbn}"].slice('title', 'subtitle', 'authors', 'number_of_pages').merge(isbn: @isbn)
    book['authors'] = take_authors(book['authors'])
    book
  end

  def take_authors(authors)
    authors.map { |author| author['name'] }
  end
end

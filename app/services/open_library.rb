class OpenLibrary
  require 'faraday'
  require 'json'

  def initialize(isbn)
    @isbn = isbn
    @options = { bibkeys: "ISBN:#{isbn}", format: 'json', jscmd: 'data' }
  end

  def fetch_data
    response = find_book
    unless response.empty?
      response = make_book_hash(response)
    end
    response
  end

  def find_book
    url = "#{Rails.application.credentials.config[:url]}/books"
    byebug
    res = Faraday.get(url, @options)
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

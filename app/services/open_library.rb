class OpenLibrary
  require 'faraday'
  require 'json'

  def initialize(isbn)
    @isbn = isbn
  end

  def fetch_data
    response = JSON.parse(books)
    response = response["#{@isbn}"].slice('title', 'subtitle', 'authors', 'number_of_pages')
    response['isbn'] = @isbn
    response['authors'] = take_authors(response['authors'])
    response
  end

  def books
    uri = "https://openlibrary.org/api/books?bibkeys=#{@isbn}&format=json&jscmd=data"
    res = Faraday.get(uri)
    res.body if res.status == 200
  end

  private

  def take_authors(authors)
    authors.map { |author| author['name'] }
  end
end

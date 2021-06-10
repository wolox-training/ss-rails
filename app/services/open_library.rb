class OpenLibrary
  require 'faraday'
  require 'json'

  def initialize(isbn)
    @isbn = isbn
  end

  def fetch_data
    response = books
    if response != 'not found'
      response = JSON.parse(response)
      response = response[@isbn.to_s].slice('title', 'subtitle', 'authors', 'number_of_pages')
      response['isbn'] = @isbn
      response['authors'] = take_authors(response['authors'])
      response
    else
      response
    end
  end

  def books
    uri = "https://openlibrary.org/api/books?bibkeys=#{@isbn}&format=json&jscmd=data"
    res = Faraday.get(uri)
    res.body != '{}' ? res.body : 'not found'
  end

  private

  def take_authors(authors)
    authors.map { |author| author['name'] }
  end
end

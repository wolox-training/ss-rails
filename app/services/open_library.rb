class OpenLibrary < ApplicationService
  include HTTParty
  base_uri 'openlibrary.org/api'

  def initialize(isbn)
    @options = { query: { bibkeys: isbn, format: 'json', jscmd: 'data' } }
    @isbn = isbn
  end

  def fetch_data
    response = books
    response = response["ISBN:#{@isbn}"].slice('title', 'subtitle', 'authors', 'number_of_pages')
    response['isbn'] = isbn
    response['authors'] = take_authors(response['authors'])
    response
  end

  def books
    self.class.get('/books', @options)
  end

  private

  def take_authors(authors)
    authors.map { |author| author['name'] }
  end
end

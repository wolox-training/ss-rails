class OpenLibraryServiceMock
  def request_success
    WebMock.stub_request(:get, 'https://openlibrary.org/api/books')
           .with(query: { bibkeys: '0385472579', format: 'json', jscmd: 'data' })
           .to_return(
             status: 200,
             body: File.read('./spec/support/fixtures/open_library_response_success.json'),
             headers: { 'Content-Type': 'application/json' }
           )
  end

  def request_empty
    WebMock.stub_request(:get, 'https://openlibrary.org/api/books')
           .with(query: { bibkeys: '0385472578', format: 'json', jscmd: 'data' })
           .to_return(
             status: 200,
             body: File.read('./spec/support/fixtures/open_library_response_empty.json'),
             headers: { 'Content-Type': 'application/json' }
           )
  end
end

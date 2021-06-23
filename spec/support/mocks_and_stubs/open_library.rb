class OpenLibraryServiceMock
  def request_success
    WebMock.stub_request(:get, 'https://openlibrary.org/api/books?bibkeys=0385472579&format=json&jscmd=data')
           .with(headers: {
                  'Accept' => '*/*',
                  'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                  'User-Agent' => 'Faraday v1.4.2'})
           .to_return(
             status: 200,
             body: File.read('./spec/support/fixtures/open_library_response_success.json'),
             headers: {})
  end

  def request_empty
    WebMock.stub_request(:get, 'https://openlibrary.org/api/books?bibkeys=0385472578&format=json&jscmd=data')
           .with(headers: {
                  'Accept' => '*/*',
                  'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                  'User-Agent' => 'Faraday v1.4.2'})
           .to_return(
             status: 200,
             body: File.read('./spec/support/fixtures/open_library_response_empty.json'),
             headers: {})
  end
end

require 'rails_helper'

describe OpenLibrary do
  mocks = OpenLibraryServiceMock.new

  describe 'GET open_library#show' do
    context 'with a valid ISBN' do
      before do
        mocks.request_success
      end

      let!(:service) { described_class.new('0385472579') }

      it 'makes an external request' do
        expect(WebMock).to have_requested(:get, 'https://openlibrary.org/api/books')
          .with(query: { bibkeys: '0385472579', format: 'json', jscmd: 'data' },
            headers: {
              'Accept'=>'*/*',
              'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'User-Agent'=>'Faraday v1.4.2'
              })
      end

      it 'returns a hash with the correct title' do
        expect(service.fetch_data[:title]).to eq('Zen speaks')
      end
    end

    context 'with a invalid ISBN' do
      before do
        mocks.request_empty
      end

      let!(:service) { described_class.new('0385472578') }

      it 'makes an external request' do
        expect(WebMock).to have_requested(:get, 'https://openlibrary.org/api/books')
          .with(query: { bibkeys: '0385472578', format: 'json', jscmd: 'data' },
            headers: {
              'Accept'=>'*/*',
              'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'User-Agent'=>'Faraday v1.4.2'
              })
      end

      it 'returns a empty hash' do
        expect(service.fetch_data[:title]).to eq('Zen speaks')
      end
    end
  end
end

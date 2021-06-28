require 'rails_helper'

describe Api::V1::OpenLibrary do
  mocks = OpenLibraryServiceMock.new
  service = described_class.new('0385472579')
  bad_request_service = described_class.new('0385472578')
  describe 'GET open_library#show' do
    context 'with a valid ISBN' do
      before do
        mocks.request_success
        service.fetch_data
      end

      it 'makes an external request' do
        expect(WebMock).to have_requested(:get, 'https://openlibrary.org/api/books')
          .with(query: { bibkeys: '0385472579', format: 'json', jscmd: 'data' })
      end

      it 'returns a hash with the correct title' do
        expect(service.fetch_data['title']).to eq('Zen speaks')
      end
    end

    context 'with a invalid ISBN' do
      before do
        mocks.request_empty
        bad_request_service.fetch_data
      end

      it 'makes an external request' do
        expect(WebMock).to have_requested(:get, 'https://openlibrary.org/api/books')
          .with(query: { bibkeys: '0385472578', format: 'json', jscmd: 'data' })
      end

      it 'returns a empty hash' do
        expect(bad_request_service.fetch_data).to eq({})
      end
    end
  end
end

require 'rails_helper'

describe '.info', type: :request do
  context 'when is valid' do
    before do
      stubbed_service = instance_double(OpenLibrary)
      allow(OpenLibrary).to receive(:new).with('0385472579').and_return(stubbed_service)
      allow(stubbed_service).to receive(:fetch_data).and_return({ 'title' => 'Originals', 'authors' => ['Adam Grant'] })
    end

    it 'Found book' do
      get '/api/v1/books/0385472579'
      expect(response.status).to be(200)
    end

    it 'Show the book title' do
      get '/api/v1/books/0385472579'
      expect(JSON.parse(response.body)['data']['title']).to eql('Originals')
    end
  end

  context 'when is not valid' do
    before do
      stubbed_service = instance_double(OpenLibrary)
      allow(OpenLibrary).to receive(:new).with('0385472578').and_return(stubbed_service)
      allow(stubbed_service).to receive(:fetch_data).and_return('not found')
    end

    it 'Book not found' do
      get '/api/v1/books/0385472578'
      expect(response.status).to be(422)
    end
    
    it 'Status: unprocessable entity' do
      get '/api/v1/books/0385472579'
      expect(JSON.parse(response.body)['status']).to eql('Unprocessable entity')
    end
  end
end

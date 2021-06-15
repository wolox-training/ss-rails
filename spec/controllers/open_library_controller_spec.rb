require 'rails_helper'

describe OpenLibraryController do
  describe action 'GET #show' do
    describe example 'with valid isbn' do
      before do
        stubbed_service = instance_double(OpenLibrary)
        allow(OpenLibrary).to receive(:new).with('0385472579').and_return(stubbed_service)
        allow(stubbed_service).to receive(:fetch_data)
          .and_return({ 'title' => 'Originals', 'authors' => ['Adam Grant'] })
      end

      it 'found book' do
        get :show, params: { isbn: '0385472579' }
        expect(response.status).to be(200)
      end

      it 'show the book title' do
        get :show, params: { isbn: '0385472579' }
        expect(JSON.parse(response.body)['title']).to eql('Originals')
      end
    end

    describe example 'with not valid isbn' do
      before do
        stubbed_service = instance_double(OpenLibrary)
        allow(OpenLibrary).to receive(:new).with('0385472578').and_return(stubbed_service)
        allow(stubbed_service).to receive(:fetch_data).and_return({})
      end

      it 'book not found' do
        get :show, params: { isbn: '0385472578' }
        expect(response.status).to be(404)
      end

      it 'message: book not found' do
        get :show, params: { isbn: '0385472578' }
        expect(JSON.parse(response.body)['errors'].first['message']).to eql('book not found')
      end
    end
  end
end

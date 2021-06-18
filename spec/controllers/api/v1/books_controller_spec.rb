require 'rails_helper'

describe Api::V1::BooksController, type: :controller do
  include_context 'Authenticated User'

  describe 'GET #index' do
    context 'when fetching all the users rents' do
      let!(:books) { create_list(:book, 3) }

      it 'responses with the users rents json' do
        expected = Panko::ArraySerializer.new(
          books, each_serializer: BookSerializer
        ).to_json
        expect(response_body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    context 'when fetching a book' do
      let!(:book) { create(:book) }

      before do
        get :show, params: { title: book.title }
      end

      it 'responses with the book json' do
        expect(response_body.to_json).to eq BookSerializer.new(
          book, root: false
        ).to_json
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end

require 'rails_helper'
require './spec/shared_context/authenticated_user'

describe Api::V1::BookSuggestionsController, type: :controller do
  include_context 'Authenticated User'
  describe 'POST #create' do
    context 'when creating a valid book suggestion' do
      let!(:new_book_suggestion_attributes) { attributes_for(:book_suggestion, user_id: user.id) }

      it 'creates a new book suggestion' do
        expect do
          post :create, params: { book_suggestion: new_book_suggestion_attributes }
        end.to change(BookSuggestion, :count).by(1)
      end

      it 'responds with 201 status' do
        post :create, params: { book_suggestion: new_book_suggestion_attributes }
        expect(response).to have_http_status(:created)
      end
    end

    context 'when creating an invalid suggestion' do
      let!(:new_book_suggestion_attributes) { attributes_for(:book_suggestion, user_id: user.id, title: nil) }

      before do
        post :create, params: { book_suggestion: new_book_suggestion_attributes }
      end

      it 'doesn\'t create a new suggestion' do
        expect do
          post :create, params: { book_suggestion: new_book_suggestion_attributes }
        end.to change(BookSuggestion, :count).by(0)
      end

      it 'returns error messages' do
        expect(response.body['error']).to be_present
      end

      it 'responds with 422 status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end

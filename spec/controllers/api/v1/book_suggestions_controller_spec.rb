require 'rails_helper'
require './spec/shared_context/authenticated_user'

describe Api::V1::BookSuggestionsController, type: :controller do
  subject(:post_create) { post :create, params: { book_suggestion: new_book_suggestion_attributes } }

  include_context 'Authenticated User'
  describe 'POST #create' do
    context 'when creating a valid book suggestion' do
      let(:new_book_suggestion_attributes) { attributes_for(:book_suggestion, user_id: user.id) }

      it 'creates a new book suggestion' do
        expect { post_create }.to change(BookSuggestion, :count).by(1)
      end

      it 'responds with 201 status' do
        post_create
        expect(response).to have_http_status(:created)
      end
    end

    context 'when creating an invalid suggestion' do
      let(:new_book_suggestion_attributes) { attributes_for(:book_suggestion, user_id: user.id, title: nil) }

      it 'doesn\'t create a new suggestion' do
        expect { post_create }.to change(BookSuggestion, :count).by(0)
      end

      it 'returns error messages' do
        post_create
        expect(response.body['error']).to be_present
      end

      it 'responds with 422 status' do
        post_create
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end

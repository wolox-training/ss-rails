require 'rails_helper'

describe BooksController, type: :controller do
  subject(:book) { build(:book) }

  include_context 'Authenticated User'

  describe 'GET #index' do
    context 'When fetching all the users rents' do
      let!(:rents) { create_list(:rent, 3, user: user) }

      before do
        get :index, params: { id: user.id }
      end

      it 'responses with the users rents json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          rents, each_serializer: RentSerializer
        ).to_json
        expect(response_body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    context 'When fetching a user rent' do
      let!(:rent) { create(:rent, user: user) }

      before do
        get :show, params: { user_id: user.id, id: rent.id }
      end

      it 'responses with the user rent json' do
        expect(response_body.to_json).to eq RentSerializer.new(
          rent, root: false
        ).to_json
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end

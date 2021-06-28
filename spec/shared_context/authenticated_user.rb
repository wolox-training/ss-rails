require 'rails_helper'

shared_context 'Authenticated User' do
  let(:user) { build(:user) }

  before do
    user.save!
    request.headers.merge! user.create_new_auth_token
  end
end

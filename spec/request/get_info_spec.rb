require 'rails_helper'

describe '.info', type: :request do
  context 'when is valid' do
    before do
      stubbed_service = instance_double(OpenLibrary)
      allow(OpenLibrary).to receive(:new).with(params[:isbn]).and_return(stubbed_service)
      allow(stubbed_service).to receive(:fetch_data).and_return({ 'title' => 'Originals', 'authors' => ['Adam Grant'] })
    end

    expect(response).to respond_with_content_type(:json)
    it { is_expected.to respond_with 200 }
  end

  context 'when is not valid' do
    before do
      stubbed_service = instance_double(OpenLibrary)
      allow(OpenLibrary).to receive(:new).with(params[:isbn]).and_return(stubbed_service)
      allow(stubbed_service).to receive(:fetch_data).and_return('not found')
    end

    it { is_expected.to respond_with 422 }
  end
end

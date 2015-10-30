require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #index' do
    it 'returns json data of all pages' do
      pages = [create(:page), create(:page)]
      get :index, format: :json
      expect(response.body).to eq(pages.to_json.to_s)
    end
  end

  describe 'POST #create' do
    it 'returns status created with valid parameters' do
      post :create, format: :json, page: attributes_for(:page)
      expect(response).to have_http_status(:created)
    end

    it 'creates pages when called with valid parameters' do
      expect do
        post :create, format: :json, page: attributes_for(:page)
      end.to change { Page.all.size }.by(1)
    end

    it 'returns status unprocessable_entity with invalid parameters' do
      post :create, format: :json, page: attributes_for(:page, title: nil)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end

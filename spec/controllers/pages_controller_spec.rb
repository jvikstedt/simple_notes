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

    it 'returns json of created page' do
      post :create, format: :json, page: attributes_for(:page)
      expect(JSON.parse(response.body)['id']).to be_kind_of(Fixnum)
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

  describe 'PATCH #update' do
    before(:each) do
      @page = create(:page)
    end

    it 'changes values in database properly' do
      patch :update, format: :json, id: @page, page: attributes_for(:page, title: 'Rails')
      expect(@page.reload.title).to eq('Rails')
    end

    it 'returns changed page as json' do
      patch :update, format: :json, id: @page, page: attributes_for(:page, title: 'Rails')
      expect(JSON.parse(response.body)['title']).to eq('Rails')
    end

    it 'returns unprocessable_entity if invalid data' do
      patch :update, format: :json, id: @page, page: attributes_for(:page, title: nil)
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'does not change data in database when invalid data' do
      patch :update, format: :json, id: @page, page: attributes_for(:page, title: nil, body: 'test')
      expect(@page.reload.body).to be_nil
    end
  end

  describe 'DELETE #destroy' do
    before(:each) do
      @page = create(:page)
    end

    it 'deletes page from database' do
      expect do
        delete :destroy, format: :json, id: @page
      end.to change { Page.all.size }.by(-1)
      expect(Page.find_by_id(@page.id)).to be_nil
    end

    it 'returns deleted page as json' do
      delete :destroy, format: :json, id: @page
      expect(response.body).to eq(@page.to_json.to_s)
    end
  end
end

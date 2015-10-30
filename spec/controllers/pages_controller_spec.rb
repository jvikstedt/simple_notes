require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #index' do
    it 'returns json data of all pages' do
      pages = [create(:page), create(:page)]
      get :index, format: :json
      expect(response.body).to eq(pages.to_json.to_s)
    end
  end
end

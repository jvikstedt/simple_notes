require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  context 'root url' do
    it 'renders home#index template' do
      expect(get: root_url).to route_to( controller: "home", action: "index")
    end
  end
end

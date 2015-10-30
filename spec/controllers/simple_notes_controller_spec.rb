require 'rails_helper'

RSpec.describe SimpleNotesController, type: :controller do
  context 'root url' do
    it 'renders simple_notes#index template' do
      expect(get: root_url).to route_to( controller: "simple_notes", action: "index")
    end
  end
end

require 'rails_helper'

RSpec.describe 'Books API', type: :request do
  describe 'GET /books' do
    before { get '/books' }

    it 'returns success' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns a json' do
      expect(response.content_type).to eq('application/json')
    end
  end
end

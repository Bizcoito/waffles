require 'rails_helper'

RSpec.describe 'Books API', type: :request do
  describe 'GET /books' do
    before do
      @book = Book.create(name: 'xunda', author: 'mironga', thumbnail: 'http://pudim.com.br/pudim.jpg')
      get '/books'
    end

    it 'returns success' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns a json', :aggregate_failures do
      expect(response.content_type).to eq('application/json')
      expect(json).not_to be_empty
      expect(json.first.to_json).to eq(@book.to_json)
    end
  end
end

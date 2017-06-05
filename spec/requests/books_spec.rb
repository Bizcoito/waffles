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

  describe 'POST /books' do
    let(:attributes) do
      {
        book: {
          name: 'xunda',
          author: 'xunder',
          thumbnail: 'http://pudim.com.br/pudim.jpg'
        }
      }
    end

    it 'returns success' do
      post '/books', params: attributes
      expect(response).to have_http_status(:ok)
    end

    it 'creates a new books' do
      expect { post '/books', params: attributes }.to change { Book.count }.by(1)
    end

    context 'when the request is not valid' do
      context 'when there is no book information' do
        let(:attributes) { { name: 'xunda' } }

        it 'returns unprocessable entity', :aggregate_failures do
          post '/books', params: attributes
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('param is missing')
        end

        it 'does not create a new book' do
          expect { post '/books', params: attributes }.not_to change { Book.count }
        end
      end
    end
  end
end

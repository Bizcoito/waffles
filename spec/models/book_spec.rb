require 'rails_helper'

RSpec.describe 'Book', type: :model do
  describe 'validations' do
    it 'validates presence of name' do
      book = Book.new(author: 'xunda', thumbnail: 'xunda')
      expect(book).not_to be_valid
    end

    it 'validates presence of author' do
      book = Book.new(name: 'xunda', thumbnail: 'xunda')
      expect(book).not_to be_valid
    end
  end
end

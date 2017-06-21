require 'rails_helper'

RSpec.describe 'Book', type: :model do
  describe 'validations' do
    it 'validates presence of name' do
      book = build(:book, name: nil)
      expect(book).not_to be_valid
    end

    it 'validates presence of author' do
      book = build(:book, author: nil)
      expect(book).not_to be_valid
    end
  end
end

class BooksController < ApplicationController
  def index
    books = Book.all
    json_response(books)
  end

  def create
    book = Book.new(book_params)
    if book.save
      render status: :ok
    else
      json_response({ message: book.errors.full_messages.join(',') }, :unprocessable_entity)
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :author, :thumbnail)
  end
end

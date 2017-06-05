class BooksController < ApplicationController
  def index
    books = Book.all
    json_response(books)
  end

  def create
    Book.create(book_params)
    render status: :ok
  end

  private

  def book_params
    params.require(:book).permit(:name, :author, :thumbnail)
  end
end

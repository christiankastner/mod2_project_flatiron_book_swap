class BooksController < ApplicationController
    def index
        @books = Book.all
    end

    def show 
        @shelf = Shelf.new
        @book = Book.find(params[:id])
        cookies[:book_viewed] = @book.id
    end
end

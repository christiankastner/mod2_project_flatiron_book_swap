class BooksController < ApplicationController
    def index
        @books = Book.all
    end

    def show 
        @shelf_book = ShelfBook.new
        @book = Book.find(params[:id])
    end

    def new
        if params[:search]
            @books = GoogleBooks.search(params[:search]).to_a[0..10]
        end
    end

    def create
    end
end

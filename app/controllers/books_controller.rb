class BooksController < ApplicationController
    def index
        @books = Book.all
    end

    def show 
        @shelf_book = ShelfBook.new
        @book = Book.find(params[:id])
    end

    def new

    end

    def create

    end


end

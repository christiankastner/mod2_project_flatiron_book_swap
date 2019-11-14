class BooksController < ApplicationController
    def index
        @books = Book.all
    end

    def show 
        @shelf_book = ShelfBook.new
        @book = Book.find(params[:id])
    end

    def new
        @book = Book.new
        if params[:search]
            @books = GoogleBooks.search(params[:search]).to_a[0..10].filter {|book| book.image_link and book.authors }
        end
    end

    def create
        @book = Book.find_or_create_by(book_params)
        redirect_to @book
    end

    private
    def book_params
        params.require(:book).permit(:title, :author, :image_link, :description)
    end
end

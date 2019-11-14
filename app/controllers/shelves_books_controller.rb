class ShelvesBooksController < ApplicationController

    def create
        @shelf_book = ShelfBook.new(shelf_book_params)
        @shelf_book.shelf_id = User.find(session[:user_id]).shelf.id
        @shelf_book.save
    end

    def destroy
        @shelf_book = ShelfBook.find(params[:id])
        @shelf = @shelf_book.shelf
        @shelf_book.delete
        redirect_to [@shelf.user, @shelf]
    end

    def swap
        
    end

    private
    def shelf_book_params
        params.require(:shelf_book).permit(:shelf_type, :book_id)
    end
end

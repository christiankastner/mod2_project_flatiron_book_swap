class ShelvesBooksController < ApplicationController
    before_action :find_shelf_book, only: [:destroy, :update]

    def create
        @shelf_book = ShelfBook.new(shelf_book_params)
        @shelf_book.shelf_id = User.find(session[:user_id]).shelf.id
        @shelf_book.save
    end

    def destroy
        @shelf = @shelf_book.shelf
        @shelf_book.delete
        redirect_to [@shelf.user, @shelf]
    end

    def update
        @shelf_book.update(shelf_type: 2)
        redirect_to [@shelf_book.shelf.user, @shelf_book.shelf]
    end

    def swap
        ShelfBook.swap(swap_params)
        redirect_to user_path(session[:user_id])
    end

    private
    def shelf_book_params
        params.require(:shelf_book).permit(:shelf_type, :book_id)
    end

    def find_shelf_book
        @shelf_book = ShelfBook.find(params[:id])
    end

    def swap_params
        {
            swap_one: ShelfBook.find(params[:shelf_book][:value]),
            swap_two: ShelfBook.find(params[:shelf_book2].keys.first.scan(/\d/).join(''))
        }
    end
end

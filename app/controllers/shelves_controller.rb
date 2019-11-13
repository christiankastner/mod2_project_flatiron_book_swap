class ShelvesController < ApplicationController
    before_action :find_shelf

    def private_create
        helper_create(shelf_type: 1)
    end

    def public_create
        helper_create(shelf_type: 2)
    end

    def desired_create
        helper_create(shelf_type: 0)
    end
    
    private
    def shelf_params
        params.require(:shelf).permit(:user_id)
    end

    def find_shelf
        @shelf = Shelf.find(params[:id])
    end

    def helper_create(shelf_type: shelf_type)
        ShelfBook.create(shelf_id: @shelf.id, book_id: cookies[:book_viewed], shelf_type: shelf_type)
        redirect_to book_path(cookies[:book_viewed])
    end
end

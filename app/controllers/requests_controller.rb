class RequestsController < ApplicationController
    # This is here as a stretch goal for requesting books from other users, rather than stealing

    
    def activate
        self.status = true
        ShelfBook.swap(swapper, swappee)
        self.save
    end
end

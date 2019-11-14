class RequestsController < ApplicationController
    belongs_to :swapper, class_name: "ShelfBook", foreign_key: :swapper_shelf_book_id
    belongs_to :swappee, class_name: "ShelfBook", foreign_key: :swappee_shelf_book_id

end

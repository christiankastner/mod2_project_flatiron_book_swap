class Request < ApplicationRecord
    belongs_to :swapper, class_name: "ShelfBook", foreign_key: :swapper_shelf_book_id
    belongs_to :swappee, class_name: "ShelfBook", foreign_key: :swappee_shelf_book_id
    # This is here as a stretch goal for requesting books from other users, rather than stealing

end

class Request < ApplicationRecord
    belongs_to :swapping, class_name: "ShelfBook", foreign_key: :swapper_shelf_book_id
    belongs_to :swapper, class_name: "ShelfBook", foreign_key: :swapped_shelf_book_id
end

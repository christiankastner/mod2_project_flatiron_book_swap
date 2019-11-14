class Request < ApplicationRecord
    belongs_to :swapper, class_name: "ShelfBook", foreign_key: :swapper_shelf_book_id
    belongs_to :swappee, class_name: "ShelfBook", foreign_key: :swappee_shelf_book_id

    def status_active
        status = true
        ShelfBook.swap(swap_one: swappee, swap_two: swapper)
    end
end

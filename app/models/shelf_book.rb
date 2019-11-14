class ShelfBook < ApplicationRecord
    # Validation to force shelf_type?
    validates :shelf_type, presence: true
    belongs_to :shelf 
    belongs_to :book

    def book_title
        self.book.title
    end

    def self
        self
    end

    def self.swap(swap_one: swap_one, swap_two: swap_two)
        shelf_one = swap_one.shelf_id 

        swap_one.shelf_id = swap_two.shelf_id
        swap_one.shelf_type = 1
        swap_one.save

        swap_two.shelf_id = shelf_one
        swap_two.shelf_type = 1
        swap_two.save
        
    end

end

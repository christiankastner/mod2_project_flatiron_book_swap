class ShelfBook < ApplicationRecord
    # Validation to force shelf_type?
    validates :shelf_type, presence: true
    belongs_to :shelf 
    belongs_to :book

    def self.swap(shelf_book_one, shelf_book_two)
        shelf_one = shelf_book_one.shelf_id 

        shelf_book_one.shelf_id = shelf_book_two.shelf_id
        shelf_book_one.shelf_type = 1
        shelf_book_one.save

        shelf_book_two.shelf_id = shelf_one
        shelf_book_two.shelf_type = 1
        shelf_book_two.save
        
    end

end

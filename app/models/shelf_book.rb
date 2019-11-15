class ShelfBook < ApplicationRecord
    # Validation to force shelf_type?
    validates :shelf_type, presence: true
    has_many :active_relationships, class_name: "Request", foreign_key: :swapper_shelf_book_id, dependent: :destroy
    has_many :swappees, through: :active_relationships, source: :swappee
    has_many :passive_relationships, class_name: "Request", foreign_key: :swapper_shelf_book_id, dependent: :destroy
    has_many :swappers, through: :passive_relationships, source: :swapper
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

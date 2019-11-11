class Book < ApplicationRecord
    has_many :shelf_books
    has_many :shelfs, through: :shelf_books
    
end

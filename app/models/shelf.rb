class Shelf < ApplicationRecord
    belongs_to :user
    has_many :shelf_books, dependent: :destroy
    has_many :books, through: :shelf_books
    # This was created to seperate user logic from shelf logic and for routing concerns when editing shelves 
    # and editing user information

end

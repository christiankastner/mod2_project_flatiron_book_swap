class Shelf < ApplicationRecord
    belongs_to :user
    has_many :books, through: :shelf_books
end

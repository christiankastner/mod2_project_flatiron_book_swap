class User < ApplicationRecord
    validates :email, uniqueness: true
    has_one :shelf, dependent: :destroy
    has_many :shelf_books, through: :shelf
    has_many :books, through: :shelf_books


    def public_shelf
        self.shelf_books.where("shelf_type = ?", "2").map do |shelf_book|
            shelf_book.book
        end
    end

    def private_shelf
        self.shelf_books.where("shelf_type = ?", "1").map do |shelf_book|
            shelf_book.book
        end
    end

    def desired_shelf
        self.shelf_books.where("shelf_type = ?", "0").map do |shelf_book|
            shelf_book.book
        end
    end
end

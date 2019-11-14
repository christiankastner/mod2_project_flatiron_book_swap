class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: true
    validates :username, uniqueness: true
    has_one :shelf
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

    def find_shelf_book(book)
        self.shelf_books.detect {|shelf_book| shelf_book.book == book}
    end

    def public_shelf_books
        self.shelf_books.where("shelf_type = ?", "2")
    end

    # Takes in book classes and user class
    def swap_book(your_book, other_user, their_book)
        if public_shelf.include? your_book
            your_shelf_book = ShelfBook.all.detect do |shelf_book| 
                shelf_book.shelf_id == self.shelf.id and shelf_book.book_id == your_book.id
            end

            their_shelf_book = ShelfBook.all.detect do |shelf_book| 
                shelf_book.shelf_id == other_user.shelf.id and shelf_book.book_id == their_book.id
            end

            ShelfBook.swap(your_shelf_book, their_shelf_book)
        else
            nil
        end
    end
end

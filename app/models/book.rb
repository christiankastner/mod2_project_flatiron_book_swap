class Book < ApplicationRecord
    has_many :shelf_books
    has_many :shelfs, through: :shelf_books

    # def search_by_title(title)
    #     books = GoogleBooks.search(title)
    # end

    def potential_swappers
        swappers = []
        self.shelf_books.each do |shelf_book|
            if shelf_book.shelf_type == 2 
                swappers << shelf_book.shelf.user
            end
        end
        swappers
    end

    def find_shelf_book(user)
        self.shelf_books.detect {|shelf_book| shelf_book.shelf.user == user}
    end

    def self.create_from_googlebooks(query)
        book = GoogleBooks.search(query).first
        if book
            self.find_or_create_by(title: book.title, author: book.authors, description: book.description, image_link: book.image_link)
        else 
            nil
        end
    end
    
    def self.create_from_txt(path)
        File.open(path).each do |line|
            self.create_from_googlebooks("#{line[0..-2]}")
        end
    end
end

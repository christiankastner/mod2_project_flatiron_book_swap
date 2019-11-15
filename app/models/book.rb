class Book < ApplicationRecord
    has_many :shelf_books, dependent: :destroy
    has_many :shelfs, through: :shelf_books

    # Returns all the possible swappers for a particular book
    def potential_swappers
        swappers = []
        self.shelf_books.each do |shelf_book|
            if shelf_book.shelf_type == 2 
                swappers << shelf_book.shelf.user
            end
        end
        swappers
    end

    # Returns the shelf_book join when a user is inputted
    def find_shelf_book(user)
        self.shelf_books.detect {|shelf_book| shelf_book.shelf.user == user}
    end

    # This is for displaying description for the html
    def display_description
        if description == nil
            return "No description available"
        end
        if description.length > 250
            return "#{description[0..249]}..."
        else
            return description
        end
    end

    # This is for translating from google books to the book class
    def self.create_from_googlebooks(query)
        book = GoogleBooks.search(query).first
        if book
            self.find_or_create_by(title: book.title, author: book.authors, description: book.description, image_link: book.image_link)
        else 
            nil
        end
    end
    
    # This is just for populating a database with a text file holding only book titles (see "titles.tct" in the current directory)
    def self.create_from_txt(path)
        File.open(path).each do |line|
            self.create_from_googlebooks("#{line[0..-2]}")
        end
    end
end

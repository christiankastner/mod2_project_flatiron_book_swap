class User < ApplicationRecord
    has_secure_password
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

    def password=(new_password)
        salt = BCrypt::Engine::generate_salt
        hashed = BCrypt::Engine::hash_secret(new_password, salt)
        self.password_digest = salt + hashed
    end

    def authenticate(password)
        salt = password_digest
        hashed = BCrypt::Engine::hash_secret(password, salt)
        return nil unless (salt + hashed) == self.password_digest
    end
end

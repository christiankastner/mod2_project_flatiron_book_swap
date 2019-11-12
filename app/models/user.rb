class User < ApplicationRecord
    validates :email, uniqueness: true
    has_one :shelf
    has_many :books, through: :shelf_books

    def public_shelf
        shelf.where("shelf_type = '2'")
    end

    def desired_shelf

    end
end

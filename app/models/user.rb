class User < ApplicationRecord
    validates :email, uniqueness: true
    has_one :shelf
    has_many :books, through: :shelf
    
end

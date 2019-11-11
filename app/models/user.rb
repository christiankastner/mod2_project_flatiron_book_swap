class User < ApplicationRecord
    has_one :shelf
    has_many :books, through: :shelf


end

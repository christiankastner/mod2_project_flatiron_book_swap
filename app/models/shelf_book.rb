class ShelfBook < ApplicationRecord
    # Validation to force shelf_type?
    validates :shelf_type, presence: true
    belongs_to :shelf 
    belongs_to :book

end

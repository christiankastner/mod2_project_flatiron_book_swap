class ShelfBook < ApplicationRecord
    # Validation to force shelf_type?
    
    belongs_to :shelf 
    belongs_to :book

end

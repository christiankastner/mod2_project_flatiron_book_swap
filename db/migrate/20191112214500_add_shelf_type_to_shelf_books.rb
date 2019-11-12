class AddShelfTypeToShelfBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :shelf_books, :shelf_type, :integer
  end
end

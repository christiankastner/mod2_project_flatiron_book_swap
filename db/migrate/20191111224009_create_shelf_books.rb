class CreateShelfBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :shelf_books do |t|
      t.integer :shelf_id
      t.integer :book_id
      t.integer :shelf_type

      t.timestamps
    end
  end
end

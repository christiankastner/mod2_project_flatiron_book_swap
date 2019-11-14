class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer :swapper_shelf_book_id
      t.integer :swappee_shelf_book_id
      t.boolean :status

      t.timestamps
    end
  end
end

class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer :swapper_shelf_book
      t.integer :swappee_shelf_book
      t.boolean :status

      t.timestamps
    end
  end
end

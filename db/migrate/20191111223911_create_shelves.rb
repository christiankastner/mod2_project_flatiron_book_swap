class CreateShelves < ActiveRecord::Migration[6.0]
  def change
    create_table :shelves do |t|
      t.string :user_id

      t.timestamps
    end
  end
end

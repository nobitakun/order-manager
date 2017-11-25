class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.references :order, foreign_key: true
      t.references :line_item, foreign_key: true

      t.timestamps
      
      t.index [:order_id, :line_item_id], unique: true
    end
  end
end

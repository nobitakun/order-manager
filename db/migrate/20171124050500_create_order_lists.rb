class CreateOrderLists < ActiveRecord::Migration[5.1]
  def change
    create_table :order_lists do |t|
      t.string :name
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end

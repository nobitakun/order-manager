class AddOrderListIdToLineItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :line_items, :order_list, foreign_key: true
  end
end

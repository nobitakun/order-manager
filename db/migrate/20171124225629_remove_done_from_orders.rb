class RemoveDoneFromOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :done, :boolean
  end
end

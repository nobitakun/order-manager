class RemovePartnerFromOrders < ActiveRecord::Migration[5.1]
  def change
    remove_reference :orders, :partner, foreign_key: true
  end
end

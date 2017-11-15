class AddDestinationToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :destination, :boolean
  end
end

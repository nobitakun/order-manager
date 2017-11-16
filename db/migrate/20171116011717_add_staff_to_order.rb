class AddStaffToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :staff, :string
  end
end

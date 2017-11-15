class AddPaidToLineItems < ActiveRecord::Migration[5.1]
  def change
    add_column :line_items, :paid, :integer
  end
end

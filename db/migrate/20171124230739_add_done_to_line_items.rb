class AddDoneToLineItems < ActiveRecord::Migration[5.1]
  def change
    add_column :line_items, :done, :boolean
  end
end

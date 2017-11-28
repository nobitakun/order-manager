class RemoveDoneFromLineItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :line_items, :done, :boolean
  end
end

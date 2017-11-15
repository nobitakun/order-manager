class ChangeDatatypeDocumentDateOfOrders3 < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :document_date, :string
  end
end

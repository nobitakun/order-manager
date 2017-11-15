class ChangeDatatypeDocumentDateOfOrders2 < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :document_date, :date
  end
end

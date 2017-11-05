class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :document_date
      t.boolean :done
      t.references :partner, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end

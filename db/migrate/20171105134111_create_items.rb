class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :namd
      t.integer :price
      t.string :unit
      t.references :item_category, foreign_key: true

      t.timestamps
    end
  end
end

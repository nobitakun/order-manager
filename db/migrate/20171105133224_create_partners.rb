class CreatePartners < ActiveRecord::Migration[5.1]
  def change
    create_table :partners do |t|
      t.string :name
      t.string :postal_code
      t.string :adress
      t.string :phone
      t.string :fax
      t.string :staff
      t.string :staff_phone

      t.timestamps
    end
  end
end

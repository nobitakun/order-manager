class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :current_postal_code
      t.string :postal_code
      t.string :current_adress
      t.string :adress
      t.string :current_phone
      t.string :phone
      t.string :owner_phone
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

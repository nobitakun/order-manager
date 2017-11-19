class AddKanaToPartner < ActiveRecord::Migration[5.1]
  def change
    add_column :partners, :kana, :string
  end
end

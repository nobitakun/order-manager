class AddKanaToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :kana, :string
  end
end

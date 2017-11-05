class RemoveNamdFromItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :namd, :string
  end
end

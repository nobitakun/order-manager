class AddReciptToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :recipt, :integer
  end
end

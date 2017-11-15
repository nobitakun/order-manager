class AddRemarkToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :remark, :string
  end
end

class RemoveStaffFromProjects < ActiveRecord::Migration[5.1]
  def change
    remove_column :projects, :staff, :string
  end
end

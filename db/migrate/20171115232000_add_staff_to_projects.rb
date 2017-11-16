class AddStaffToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :staff, :string
  end
end

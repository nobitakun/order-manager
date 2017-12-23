class AddMrsPhoneToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :mrs_phone, :string
  end
end

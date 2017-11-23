class AddColumnToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :contract_date, :string
    add_column :projects, :finish_date, :string
  end
end

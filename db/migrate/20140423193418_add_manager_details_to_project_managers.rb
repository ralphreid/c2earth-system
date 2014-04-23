class AddManagerDetailsToProjectManagers < ActiveRecord::Migration
  def change
    add_column :project_managers, :manager_initials, :string
    add_column :project_managers, :manager_firstname, :string
    add_column :project_managers, :manager_lastname, :string
  end
end

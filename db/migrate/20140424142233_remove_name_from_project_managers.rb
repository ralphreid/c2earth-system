class RemoveNameFromProjectManagers < ActiveRecord::Migration
  def change
    remove_column :project_managers, :name, :string
  end
end

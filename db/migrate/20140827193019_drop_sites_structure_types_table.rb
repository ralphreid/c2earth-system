class DropSitesStructureTypesTable < ActiveRecord::Migration
  def change
    drop_table :sites_structure_types
  end
end

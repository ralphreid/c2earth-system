class CreateJoinTableSiteStructureType < ActiveRecord::Migration
  def change
    create_join_table :sites, :structure_types do |t|
      t.index [:site_id, :structure_type_id]
      t.index [:structure_type_id, :site_id]
    end
  end
end

class CreateJoinTableSiteStructureType < ActiveRecord::Migration
  def change
    create_join_table :sites, :structure_types do |t|
      t.index [:site_id, :structure_type_id], unique: true, name: 'by_site_structure_type'
      t.index [:structure_type_id, :site_id], unique: true, name: 'by_structure_type_site'
    end
  end
end

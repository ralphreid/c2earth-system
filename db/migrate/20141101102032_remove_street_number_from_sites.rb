class RemoveStreetNumberFromSites < ActiveRecord::Migration
  def change
    remove_column :sites, :street_number
    remove_column :sites, :street_name
  end
end

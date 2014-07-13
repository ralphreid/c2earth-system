class AddSiteLatLongToSite < ActiveRecord::Migration
  def change
    add_column :sites, :site_lat, :float
    add_column :sites, :site_long, :float
  end
end

class AddCityLatLongToSite < ActiveRecord::Migration
  def change
    add_column :sites, :city_lat, :float
    add_column :sites, :city_long, :float
  end
end

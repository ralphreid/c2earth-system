class AddGeoToSites < ActiveRecord::Migration
  def change
    add_column :sites, :latitude, :float
    add_column :sites, :longitude, :float
    add_column :sites, :state_code, :string
    add_column :sites, :zipcode, :integer
    add_column :sites, :country_code, :string
    add_column :sites, :country, :string
  end
end

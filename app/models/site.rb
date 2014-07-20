class Site < ActiveRecord::Base
  has_and_belongs_to_many :structure_types
  geocoded_by :full_street_address
  # geocoded_by :full_street_address, :latitude => :site_lat, :longitude => :site_long
  # geocoded_by :city_location, :latitude => :city_lat, :longitude => :city_long
  # reverse_geocoded_by :latitude, :longitude do |obj, results|
  #   if geo = results.first
  #     obj.address = geo.address
  #   end
  # end
  # # reverse_geocoded_by :city_lat, :city_long
  after_validation :geocode

  def full_street_address
    [street_number, street_name, city, zipcode, state_code, country_code].compact.join(', ')
  end

end

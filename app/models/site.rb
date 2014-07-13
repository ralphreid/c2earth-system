class Site < ActiveRecord::Base
  has_and_belongs_to_many :structure_types
  geocoded_by :full_street_address
  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.city = geo.city
      obj.zipcode = geo.postal_code
      obj.country_code = geo.country_code
      obj.country = geo.country
      obj.state_code = geo.state_code
      obj.address = geo.address
    end
  end
  after_validation :geocode, :reverse_geocode

  DEFAULT_CITY = "San Jose"


  def full_street_address
    [street_number, street_name, city, zipcode, state_code, country_code].compact.join(', ')
  end

  def city_location
    [city, state_code, country_code].compact.join(',')
  end

  def self.lookup(city=nil)
    unless city.nil?
      Site.where(city: city)
    else
      Site.where(city: DEFAULT_CITY)
    end
  end
end

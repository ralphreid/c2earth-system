class Site < ActiveRecord::Base
  has_and_belongs_to_many :structure_types
  geocoded_by :full_street_address
  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.city = geo.city
      obj.zipcode = geo.postal_code
      obj.country = geo.country
      obj.state_code = geo.state_code
      obj.address = geo.address
    end
  end
  after_validation :geocode, :reverse_geocode


  def full_street_address
    return "#{self.number.to_s} #{self.address}, #{self.city}, #{self.state}"
    # [street, city, state, country].compact.join(', ')
  end
end

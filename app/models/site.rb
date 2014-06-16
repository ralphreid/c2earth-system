class Site < ActiveRecord::Base
  has_and_belongs_to_many :structure_types
  geocoded_by :full_street_address
  after_validation :geocode


  # more work at http://rdoc.info/github/alexreisner/geocoder/master/frames
  # http://www.rubygeocoder.com/

  def full_street_address
    return "#{self.number.to_s} #{self.address}, #{self.city}"
  end
end

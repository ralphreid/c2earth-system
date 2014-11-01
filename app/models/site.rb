class Site < ActiveRecord::Base
  has_many :activities
  belongs_to :fault
  has_many :projects, through: :activities
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
    [address, city, zipcode, state_code, country_code].compact.join(', ')
  end

  def self.import(file)
    rows = []
    CSV.foreach(file.path, headers: true) do |row|
      rows << row
    end
    rows = rows.uniq {|r| [r["address"], r["city"], r["county"]]}

    rows.each do |row|
      site = Site.where(address: row["address"], city: row["city"], county: ["county"]).first || new
      site.attributes = row.to_hash.except("StructureType", "Fault", "SiteNumber")
      site.save!
      # Site.create! row.to_hash.except("StructureType", "Fault", "SiteNumber")
    end
  end

end

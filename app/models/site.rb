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

    exception_fields = ["ProjectNumber","ProjectName1","ProjectName2","ProjectManager","InvestigationType","StructureType","ProjectDescription","ProjectPrefix","ProposalDate","ProposalNumber","ReportDate","SiteNumber","StreetName","City","County","Fault","APN","TOMBROBOX","LOC_PAGE","LOC_LONG","LOC_LAT","Vendor","Notes","ClientName","ClientType","ClientAddress","ClientCity","ClientState","ClientZip","ClientWorkPhone","ClientHomePhone","ClientCellPhone","ClientFaxPhone","ClientEmail","ClientNote","ClientName2","ClientType2","ClientNote2","ClientAddress2","ClientCity2","ClientState2","ClientZip2","ClientWorkPhone2","ClientHomePhone2","ClientCellPhone2","ClientFaxPhone2","ClientEmail2","InsPolicyNum","InsCompany","InsContact","InsAddress","InsCity","InsZip","InsPhone","InsFax","InsEmailWeb","ImsNotes","BillName","BillAttention","BillAddress","BillCity","BillState","BillZip","BadPayHistory","StructuralCompany","StructuralEngineer","StructuralInfo","CivilCompany","CivilEngineer","CivilInfo","SurveyCompany","Surveyor","SurveyorInfo","ArchitectCompany","Architect","ArchitectInfo","AttorneyCompany","Attorney","AttorneyInfo","RealestateBuyer","AgentBuyer","BuyerInfo","RealestateSeller","AgentSeller","SellerInfo","KOR1Company","KOR1Contact","KOR1Info","KOR2Company","KOR2contact","KOR2Info","KOR3Company","KOR3Contact","KOR3Info","Consultant1","ConsultantInfo1","Consultant2","ConsultantInfo2","Consultant3","ConsultantInfo3","Keyword","Memo","Title1","Note1","Title2","Note2","Title3","Note3","Title4","Note4","Title5","Note5"]
    exception_fields -= ["address", "city", "county"]

    rows = []
    CSV.foreach(file.path, headers: true) do |row|
      rows << row
    end
    rows = rows.uniq {|r| [r["address"], r["city"], r["county"]]}

    rows.each do |row|
      site = Site.where(address: row["address"], city: row["city"], county: ["county"]).first || new
      # site.attributes = row.to_hash.except(exception_fields.map {|str| "\"#{str.downcase}\""}.join(','))
      # site.attributes = row.to_hash.except(exception_fields)
      # "['#{exception_fields.join("','")}']"
      # site.attributes = row.to_hash.except("ProjectNumber", "ProjectName1", "ProjectName2", "ProjectManager", "InvestigationType", "StructureType", "ProjectDescription", "ProjectPrefix", "ProposalDate", "ProposalNumber", "ReportDate", "SiteNumber", "StreetName", "Fault", "APN", "TOMBROBOX", "LOC_PAGE", "LOC_LONG", "LOC_LAT", "Vendor", "Notes", "ClientName", "ClientType", "ClientAddress", "ClientCity", "ClientState", "ClientZip", "ClientWorkPhone", "ClientHomePhone", "ClientCellPhone", "ClientFaxPhone", "ClientEmail", "ClientNote", "ClientName2", "ClientType2", "ClientNote2", "ClientAddress2", "ClientCity2", "ClientState2", "ClientZip2", "ClientWorkPhone2", "ClientHomePhone2", "ClientCellPhone2", "ClientFaxPhone2", "ClientEmail2", "InsPolicyNum", "InsCompany", "InsContact", "InsAddress", "InsCity", "InsZip", "InsPhone", "InsFax", "InsEmailWeb", "ImsNotes", "BillName", "BillAttention", "BillAddress", "BillCity", "BillState", "BillZip", "BadPayHistory", "StructuralCompany", "StructuralEngineer", "StructuralInfo", "CivilCompany", "CivilEngineer", "CivilInfo", "SurveyCompany", "Surveyor", "SurveyorInfo", "ArchitectCompany", "Architect", "ArchitectInfo", "AttorneyCompany", "Attorney", "AttorneyInfo", "RealestateBuyer", "AgentBuyer", "BuyerInfo", "RealestateSeller", "AgentSeller", "SellerInfo", "KOR1Company", "KOR1Contact", "KOR1Info", "KOR2Company", "KOR2contact", "KOR2Info", "KOR3Company", "KOR3Contact", "KOR3Info", "Consultant1", "ConsultantInfo1", "Consultant2", "ConsultantInfo2", "Consultant3", "ConsultantInfo3", "Keyword", "Memo", "Title1", "Note1", "Title2", "Note2", "Title3", "Note3", "Title4", "Note4", "Title5", "Note5")
      # site.attributes = row.to_hash.except("StructureType", "Fault", "SiteNumber")
      site.save!
    end
  end

end

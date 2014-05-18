require 'array_content'
# Generated with RailsBricks
# Initial seed file to use with Devise User Model

# Create new user accounts only if non-exist
if User.count == 0
  # Temporary admin account
  u = User.new(
    username: "admin",
    email: "admin@example.com",
    password: "1234",
    password_confirmation: "1234",
    admin: true
  )
  u.skip_confirmation!
  u.save!

  # Test user accounts
  (1..5).each do |i|
    u = User.new(
        username: "user#{i}",
        email: "user#{i}@example.com",
        password: "1234",
        password_confirmation: "1234"
    )
    u.skip_confirmation!
    u.save!

    puts "#{i} test users created..." if (i % 5 == 0)
  end
end

# client_types records
ClientType.destroy_all if ClientType.exists?
db_url_client_types = "ProjectsbyClientType.txt"
pms = ArrayContent.new(db_url_client_types, true, 'local')
client_types = pms.get_arr_of_arrs
client_types.each do |row|
  ClientType.create!(client_type: row[0])
end
puts "#{ClientType.count} Client Types created from #{pms.get_type}"

# company_types
CompanyType.destroy_all if CompanyType.exists?
names = [
  "structural",
  "civil",
  "surveying",
  "architecture",
  "legal"
]
names.each do |value|
  CompanyType.create!(name: value)
end
puts "#{CompanyType.count} Company Types created from #{pms.get_type}"

# companies records
Company.destroy_all if Company.exists?
db_url_companies = 'companies.csv'
pms = ArrayContent.new(db_url_companies, true, 'local')
companies = pms.get_arr_of_arrs
companies.each do |row|
  c = Company.create!( 
    name: row[1])
  t = CompanyType.find_by name: row[0]
  c.company_types.push t
end
puts "#{Company.count} Companies created from #{pms.get_type}"

# investigation_types records
# InvestigationType.destroy_all if InvestigationType.exists?
# db_url_investigation_types = "ProjectsbyInvestigationType.txt"
# pms = ArrayContent.new(db_url_investigation_types, true, 'local')
# investigation_types = pms.get_arr_of_arrs
# investigation_types.each do |row|
#   InvestigationType.create!(investigation_type: row[0])
# end
# puts "#{InvestigationType.count} Investigation Types created from #{pms.get_type}"

# faults records
Fault.destroy_all if Fault.exists?
fault_names = [
  "Berrocal",
  "Berryessa",
  "Calaveras",
  "Crosley",
  "Hayward",
  "Monte Vista",
  "N/A",
  "San Andreas",
  "Shannon",
  "Zyanti"
]
fault_names.each do |value|
  Fault.create!(name: value)
end
puts "#{Fault.count} Faults created from hardcoded array"

# phases records




# project_managers records [ProjectManagers.txt]
# ProjectManager.destroy_all if ProjectManager.exists?
# db_url_project_managers = "ProjectManagers.txt"
# pms = ArrayContent.new(db_url_project_managers, true, 'local')
# project_managers = pms.get_arr_of_arrs
# project_managers.each do |row|
#   ProjectManager.create!(
#     manager_initials: row[0],
#     manager_firstname: 'I want to Updated',
#     manager_lastname: 'mee too, mon',
#     name: row[1])
# end
# puts "#{ProjectManager.count} Project Managers created from #{pms.get_type}"







# structure_types records
StructureType.destroy_all if StructureType.exists?
db_url_structure_types = "structure_types.txt"
pms = ArrayContent.new(db_url_structure_types, true, 'local')
structure_types = pms.get_arr_of_arrs
structure_types.each do |row|
  StructureType.create!(
    name: row[0])
end
puts "#{StructureType.count} Structure Types created from #{pms.get_type}"

# sites records
Site.destroy_all if Site.exists?
db_url_sites = "sites.txt"
pms = ArrayContent.new(db_url_sites, true, 'local')
sites = pms.get_arr_of_arrs
sites.each do |row|
  s = Site.create!(
    number: row[0],
    address: row[1],
    city: row[2],
    county: row[3],
    loc_page: row[4],
    loc_longitude: row[5],
    loc_latitude: row[6],
    apn: row[7],
    tombrobox: row[8],
    )
  st = StructureType.find_by name: row[10]
  s.structure_types = st
  s.save!
end
puts "#{Site.count} Sites created from #{pms.get_type}"

# stakeholder_types records
StakeholderType.destroy_all if StakeholderType.exists?
names = [
  "survey",
  "structural",
  "civil",
  "surveying",
  "architecture",
  "attorney",
  "seller-info",
  "seller-agent",
  "seller-realestate",
  "buyer-from-all-data",
  "buyer-agent",
  "buyer-realestate",
]
names.each do |value|
  StakeholderType.create!(name: value)
end
puts "#{StakeholderType.count} Stakeholder Types created from hardcoded array"

# stakeholders records
Stakeholder.destroy_all if Stakeholder.exists?
db_url_stakeholders = 'company_stakeholders.csv'
pms = ArrayContent.new(db_url_stakeholders, true, 'local')
stakeholders = pms.get_arr_of_arrs
stakeholders.each do |row|
  s = Stakeholder.create!( 
    name: row[2],
    notes: row[3])
  t = StakeholderType.find_by name: row[0]
  s.stakeholder_types.push t
  c = Company.find_by name: row[1]
  s.company = c
  s.save!
end

# The data seems probablamatic so find another way to impoart
# db_url_stakeholders = 'stakeholders.csv'
# pms = ArrayContent.new(db_url_stakeholders, true, 'local')
# stakeholders = pms.get_arr_of_arrs
# stakeholders.each do |row|
#   s = Stakeholder.create!( 
#     name: row[1])
#   t = StakeholderType.find_by name: row[0]

#   s.stakeholder_types.push t
#   s.save!
# end
puts "#{Stakeholder.count} Stakeholders created from #{pms.get_type}"

# projects records

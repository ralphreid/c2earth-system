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

# client_types records [ProjectsbyClientType.txt]
ClientType.destroy_all if ClientType.exists?
# db_url_client_types = "https://www.dropbox.com/s/ou0e9a0bat0wl1f/ProjectsbyClientType.txt"
db_url_client_types = "ProjectsbyClientType.txt"
pms = ArrayContent.new(db_url_client_types, true, 'local')
client_types = pms.get_arr_of_arrs
client_types.each do |row|
  ClientType.create(client_type: row[0])
end
puts "#{ClientType.count} Client Types created from #{pms.get_type}"

# companies records [AllProject_Information.txt]
# db_url_all_project_info = "https://www.dropbox.com/s/6wnjgd7w0qoycs2/All%20Project%20Information.csv"
# pms = ArrayContent.new(db_url_all_project_info, true)
# all_project_info = pms.get_arr_of_arrs

# investigation_types
InvestigationType.destroy_all if InvestigationType.exists?
db_url_investigation_types = "ProjectsbyInvestigationType.txt"
pms = ArrayContent.new(db_url_investigation_types, true, 'local')
investigation_types = pms.get_arr_of_arrs
investigation_types.each do |row|
  InvestigationType.create(investigation_type: row[0])
end
puts "#{InvestigationType.count} Investigation Types created from #{pms.get_type}"

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
  Fault.create(name: value)
end
puts "#{Fault.count} Faults created"

# phases records




# project_managers records [ProjectManagers.txt]
ProjectManager.destroy_all if ProjectManager.exists?
# db_url_project_managers = "https://www.dropbox.com/sh/sl727ql5hyffqn5/FhptN8NQu3/ProjectManagers.txt"
db_url_project_managers = "ProjectManagers.txt"
pms = ArrayContent.new(db_url_project_managers, true, 'local')
project_managers = pms.get_arr_of_arrs
project_managers.each do |row|
  ProjectManager.create(
    manager_initials: row[0],
    manager_firstname: 'I want to Updated',
    manager_lastname: 'mee too, mon',
    name: row[1])
end
puts "#{ProjectManager.count} Project Managers created from #{pms.get_type}"


# projects records


# sites records


# stakeholder_types records


# stakeholders


# structure_types records
StructureType.destroy_all if StructureType.exists?
# db_url_structure_types = "https://www.dropbox.com/s/zieyd2267a2k7yh/ProjectsbyStructureType.txt"
db_url_structure_types = "ProjectsbyStructureType.txt"
pms = ArrayContent.new(db_url_structure_types, true, 'local')
structure_types = pms.get_arr_of_arrs
structure_types.each do |row|
  StructureType.create(
    structure_type: row[0])
end
puts "#{StructureType.count} Structure Types created from #{pms.get_type}"

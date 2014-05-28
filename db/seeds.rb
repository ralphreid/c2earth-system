require 'array_content'

user_switch = 'off'
client_type_switch = 'off'
client_switch = 'off'
company_type_switch = 'off'
company_switch = 'off'
investigation_type_switch = 'off'
fault_switch = 'off'
project_manager_switch = 'off'
structure_type_switch = 'off'
site_switch = 'off'
stakeholder_type_switch = 'off'
stakeholder_switch = 'off'
project_switch = 'on'
phase_switch = 'off'

# Create new user accounts only if non-exist
case user_switch
when 'on'
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
end

# client_types records
case client_type_switch
when 'on'
  ClientType.destroy_all if ClientType.exists?
  db_url_client_types = "client_types.txt"
  ClientType.create!(name: 'TBC')
  pms = ArrayContent.new(db_url_client_types, true, 'local')
  client_types = pms.get_arr_of_arrs
  client_types.each do |row|
    client_type_to_add = row[0]
    client_type_to_add.capitalize
    ClientType.create!(name: client_type_to_add)
  end
  puts "#{ClientType.count} Client Types created from #{pms.get_type}"
end

# client records
case client_switch
when 'on'
  Client.destroy_all if Client.exists?
  db_url_clients = 'clients.txt'
  pms = ArrayContent.new(db_url_clients, true, 'local')
  clients = pms.get_arr_of_arrs
  clients.each do |row|
    c = Client.create!(
      name: row[2],
      name_alternate: row[3],
      address: row[4],
      city: row[5],
      state: row[6],
      zip: row[7],
      work_phone: row[8],
      home_phone: row[9],
      cell_phone: row[10],
      fax_phone: row[11],
      email: row[12],
      address_alternate: row[13],
      city_alternate: row[14],
      state_alternate: row[15],
      zip_alternate: row[16],
      work_phone_alternate: row[17],
      home_phone_alternate: row[18],
      cell_phone_alternate: row[19],
      fax_phone_alternate: row[20],
      email_alternate: row[21],
      notes: row[22]
    )
    c.save!
    client_type_to_add = row[0]
    client_type_to_add.capitalize
    ct = ClientType.find_by name: client_type_to_add
    unless ct.nil?
      c.client_types.push ct
    end
    c.save!
    client_type_to_add = row[1]
    client_type_to_add.capitalize
    ct = ClientType.find_by name: client_type_to_add
    unless ct.nil? or ct.name == "TBC"
      c.client_types.push ct
    end
    c.save!
  end
  puts "#{Client.count} Client created from #{pms.get_type}"
end

# company_types
case company_type_switch
when 'on'
  CompanyType.destroy_all if CompanyType.exists?
  names = [
    "Structural",
    "Civil",
    "Surveying",
    "Architecture",
    "Legal",
    "TBC"
  ]
  names.each do |value|
    CompanyType.create!(name: value)
  end
  puts "#{CompanyType.count} Company Types created from #{pms.get_type}"
end

# companies records
case company_switch
when 'on'
  Company.destroy_all if Company.exists?
  db_url_companies = 'companies.csv'
  pms = ArrayContent.new(db_url_companies, true, 'local')
  companies = pms.get_arr_of_arrs
  companies.each do |row|
    c = Company.create!( name: row[1] )
    type_to_add = row[0]
    type_to_add.capitalize
    t = CompanyType.find_by name: type_to_add
    unless t.nil?
      c.company_types.push t
    end
  end
  puts "#{Company.count} Companies created from #{pms.get_type}"
end

# investigation_types records
case investigation_type_switch
when 'on'
  InvestigationType.destroy_all if InvestigationType.exists?
  db_url_investigation_types = "ProjectsbyInvestigationType.txt"
  pms = ArrayContent.new(db_url_investigation_types, true, 'local')
  investigation_types = pms.get_arr_of_arrs
  investigation_types.each do |row|
    investigation_type_to_add = row [0]
    investigation_type_to_add.capitalize
    InvestigationType.create! investigation_type: investigation_type_to_add
  end
  puts "#{InvestigationType.count} Investigation Types created from #{pms.get_type}"
end

# faults records
case fault_switch
when 'on'
  Fault.destroy_all if Fault.exists?
    fault_names =
    ["Berrocal",
    "Berryessa",
    "Calaveras",
    "Crosley",
    "Hayward",
    "Monte Vista",
    "N/A",
    "San Andreas",
    "Shannon",
    "Zyanti"]
  fault_names.each do |value|
    Fault.create! name: value
  end
  puts "#{Fault.count} Faults created from hardcoded array"
end

# project_managers records
case project_manager_switch
when 'on'
  ProjectManager.destroy_all if ProjectManager.exists?
  db_url_project_managers = "ProjectManagers.txt"
  pms = ArrayContent.new(db_url_project_managers, true, 'local')
  project_managers = pms.get_arr_of_arrs
  project_managers.each do |row|
    ProjectManager.create!(
      manager_initials: row[0],
      manager_firstname: 'I want to be updated',
      manager_lastname: 'mee too, mon',
      name: row[1])
  end
  puts "#{ProjectManager.count} Project Managers created from #{pms.get_type}"
end

# structure_types records
case structure_type_switch
when 'on'
  StructureType.destroy_all if StructureType.exists?
  StructureType.create!(name: 'TBC')
  StructureType.create!(name: "Barn Or Water Tower")
  StructureType.create!(name: "Pipeline For Water")
  StructureType.create!(name: "Single Family Home")
  StructureType.create!(name: "Condo Or Townhouse")
  db_url_structure_types = "structure_types.txt"
  pms = ArrayContent.new(db_url_structure_types, true, 'local')
  structure_types = pms.get_arr_of_arrs
  structure_types.each do |row|
    structure_type_to_add = row[0]
    structure_type_to_add.split.map(&:capitalize).join(' ')
    StructureType.create! name: structure_type_to_add
  end
  puts "#{StructureType.count} Structure Types created from #{pms.get_type}"
end

# sites records
case site_switch
when 'on'
  Site.destroy_all if Site.exists?
  db_url_sites = "sites.txt"
  pms = ArrayContent.new(db_url_sites, true, 'local')
  sites = pms.get_arr_of_arrs
  sites.each do |row|
    unless row == ["TBC", "TBC", "TBC", "TBC", "TBC", "TBC", "TBC", "TBC", "TBC", "TBC", "TBC"]
      s = Site.create!(
        number: row[9],
        address: row[1],
        city: row[2],
        county: row[3],
        loc_page: row[4],
        loc_longitude: row[5],
        loc_latitude: row[6],
        apn: row[7],
        tombrobox: row[10]  
        )
      structure_type_to_add = row[0]
      structure_type_to_add.split.map(&:capitalize).join(' ')
      st = StructureType.find_by name: structure_type_to_add
      unless st.nil?
        s.structure_types.push st
      end
      s.save!
    end
  end
  puts "#{Site.count} Sites created from #{pms.get_type}"
end

# stakeholder_types records
case stakeholder_type_switch
when 'on'
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
end

# stakeholders records
case stakeholder_switch
when 'on'
  Stakeholder.destroy_all if Stakeholder.exists?
  db_url_stakeholders = 'company_stakeholders.csv'
  pms = ArrayContent.new(db_url_stakeholders, true, 'local')
  stakeholders = pms.get_arr_of_arrs
  stakeholders.each do |row|
    s = Stakeholder.create!( 
      name: row[2],
      notes: row[3])
    t = StakeholderType.find_by name: row[0]
    unless t.nil?
      s.stakeholder_types.push t
    end
    c = Company.find_by name: row[1]
    unless c.nil?
      s.company = c
    end
    s.save!
  end

  db_url_stakeholders = 'stakeholders.csv'
  pms = ArrayContent.new(db_url_stakeholders, true, 'local')
  stakeholders = pms.get_arr_of_arrs
  stakeholders.each do |row|
    s = Stakeholder.find_by name: row[1]
    if s.nil?
      s = Stakeholder.create!( 
        name: row[1])
      t = StakeholderType.find_by name: row[0]
      unless t.nil?
        s.stakeholder_types.push t
      end
    end
    s.save!
  end
  puts "#{Stakeholder.count} Stakeholders created from #{pms.get_type}"
end

# projects records
case project_switch
when 'on'
  Project.destroy_all if Project.exists?
  db_url_projects = 'projects.csv'
  pms = ArrayContent.new(db_url_projects, true, 'local')
  projects = pms.get_arr_of_arrs
  projects.each do |row|
    Project.create!(
      name: row[0],
      name_alternate: row[1],
      number: row[2],
      prefix: row[3],
      description: row[4]
      )
  end
  puts "#{Project.count} Projects created from #{pms.get_type}"
end

# phases records
case phase_switch
when 'on'
  Phase.destroy_all if Phase.exists?
  db_url_phases = 'phases.csv'
  pms = ArrayContent.new(db_url_phases, true, 'local')
  phases = pms.get_arr_of_arrs
  phases.each do |row|
    p = Phase.create!(
      title: "Unknown - Legacy"
      )
  end
end

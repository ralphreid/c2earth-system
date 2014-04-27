require 'dropbox_content'
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
db_url_client_types = "https://www.dropbox.com/s/ou0e9a0bat0wl1f/ProjectsbyClientType.txt"
pms = DropboxContentSeed.new(db_url_client_types, true)
client_types = pms.get_arr_of_arrs
client_types.each do |row|
  ClientType.create(client_type: row[0])
end
puts "#{ClientType.count} Client Types created"


# companies records [AllProject_Information.txt,,,,,,,]
db_url_all_project_info = "https://www.dropbox.com/s/z90jznpt98tvs3h/AllProject_Information.txt"
pms = DropboxContentSeed.new(db_url_all_project_info, true)
all_project_info = pms.get_arr_of_arrs



# faults records


# phases records




# project_managers records [ProjectManagers.txt]
db_url_project_managers = "https://www.dropbox.com/sh/sl727ql5hyffqn5/FhptN8NQu3/ProjectManagers.txt"
pms = DropboxContentSeed.new(db_url_project_managers, true)
project_managers = pms.get_arr_of_arrs
project_managers.each do |row|
  ProjectManager.create(
    manager_initials: row[0],
    manager_firstname: 'I want to Updated',
    manager_lastname: 'mee too, mon',
    name: row[1])
end
puts "#{ProjectManager.count} Project Managers created"


# projects records


# sites records


# stakeholder_types records


# stakeholders


# structure_types records



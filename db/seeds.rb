require 'dropbox_content'
# Generated with RailsBricks
# Initial seed file to use with Devise User Model

# Temporary admin account
u = User.new(
    username: "admin",
    email: "admin@example.com",
    password: "1234",
    password_confirmation: "1234",
    admin: true
) if User.count == 0
u.skip_confirmation!
u.save!

# Test user accounts
(1..5).each do |i|
  u = User.new(
      username: "user#{i}",
      email: "user#{i}@example.com",
      password: "1234",
      password_confirmation: "1234"
  ) if User.count == 0
  u.skip_confirmation!
  u.save!

  puts "#{i} test users created..." if (i % 5 == 0)

end

# project_managers records
db_url = "https://www.dropbox.com/sh/sl727ql5hyffqn5/FhptN8NQu3/ProjectManagers.txt"
pms = DropboxContentSeed.new(db_url, true)
project_managers = pms.get_arr_of_arrs
project_managers.each do |row|
  ProjectManager.create(
    manager_initials: row[0],
    manager_firstname: 'I want to Updated',
    manager_lastname: 'mee too, mon',
    name: row[1])
end

puts "#{ProjectManager.count} Project Managers created"

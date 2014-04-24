# Generated with RailsBricks
# Initial seed file to use with Devise User Model

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

# project_managers records
project_managers = [
  ["BT","Bill", "Know but needs updating"],
  ["CH","Chris","Hundemer"],
  ["CR","Craig","Reid"],
  ["DB","Know but needs updating","Know but needs updating"],
  ["DH","Know but needs updating","Know but needs updating"],
  ["DK","Know but needs updating","Know but needs updating"],
  ["DN","Know but needs updating","Know but needs updating"],
  ["DP","Know but needs updating","Know but needs updating"],
  ["EM","Know but needs updating","Know but needs updating"],
  ["JC","Know but needs updating","Know but needs updating"],
  ["JF","Know but needs updating","Know but needs updating"],
  ["JR","Know but needs updating","Know but needs updating"],
  ["JS","Know but needs updating","Know but needs updating"],
  ["KG","Know but needs updating","Know but needs updating"],
  ["KK","Know but needs updating","Know but needs updating"],
  ["KS","Know but needs updating","Know but needs updating"],
  ["KW","Know but needs updating","Know but needs updating"],
  ["LH","Know but needs updating","Know but needs updating"],
  ["LS","Laura Stupi","Know but needs updating"],
  ["MB","Mark Baumann","Know but needs updating"],
  ["MM","Mark","Macke"],
  ["RU","Rex","Upp"],
  ["SC","Know but needs updating","Know but needs updating"],
  ["SM","Know but needs updating","Know but needs updating"],
  ["UU","Know but needs updating","Know but needs updating"],
  ["YW","Know but needs updating","Know but needs updating"]
]

project_managers.each do |row|
  ProjectManager.create(
    manager_initials: row[0],
    manager_firstname: row[1],
    manager_lastname: row[2]
    )
end

puts "#{ProjectManager.count} Project Managers created"

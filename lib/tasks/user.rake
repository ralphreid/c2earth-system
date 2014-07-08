namespace :user do
  desc "Create test users"
  task create_test_users: :environment do
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
      end
    end

    puts "#{User.count} users exist..."
  end
  
end

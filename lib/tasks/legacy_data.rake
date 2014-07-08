namespace :legacy_data do
  desc "Load all legacy data"
  task load: :environment do
    Rake::Task["user:create_admin"].invoke
    Rake::Task["user:create_users"].invoke
  end
end

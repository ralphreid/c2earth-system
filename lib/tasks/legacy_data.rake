namespace :legacy_data do
  desc "Load all legacy data"
  task load: :environment do
    # Rake::Task["user:create_test_users"].invoke
    Rake::Task["client_type:create_client_types"].invoke
  end
end

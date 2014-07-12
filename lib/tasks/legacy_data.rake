namespace :legacy_data do
  desc "Load all legacy data"
  task load: :environment do
    # Rake::Task["user:create_test_users"].invoke
    # Rake::Task["client_type:create_client_types"].invoke
    # Rake::Task["client:create_clients"].invoke
    # Rake::Task["company_type:create_company_types"].invoke
    # Rake::Task["company:create_companies"].invoke
    # Rake::Task["investigation_type:create_investigation_types"].invoke
    # Rake::Task["fault:create_faults"].invoke
    # Rake::Task["project_manager:create_project_managers"].invoke
  end
end

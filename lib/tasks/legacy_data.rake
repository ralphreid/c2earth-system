
namespace :legacy_data do
  desc "Load all legacy data"
  task load: :environment do


    Rake::Task["user:create_test_users"].invoke

    Rake::Task["client_type:create_client_types"].invoke(3)
    Rake::Task["client:create_clients"].invoke(3)
    Rake::Task["company_type:create_company_types"]
    Rake::Task["company:create_companies"].invoke(10)
    Rake::Task["investigation_type:create_investigation_types"].invoke(10)
    Rake::Task["fault:create_faults"].invoke
    Rake::Task["project_manager:create_project_managers"].invoke(10)
    Rake::Task["structure_type:create_structure_types"].invoke
    Rake::Task["site:create_sites"].invoke(200)
    Rake::Task["stakeholder_type:create_stakeholder_types"].invoke
    Rake::Task["stakeholder:create_stakeholders"].invoke(100)
    # # Rake::Task["project:create_projects"].invoke
    # # Rake::Task["phase:create_phases"].invoke
  end
end

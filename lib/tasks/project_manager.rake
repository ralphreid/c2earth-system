require 'array_content'

namespace :project_manager do
  desc "Create project managers"
  task :create_project_managers, [:sample_amount] => :environment do |t, args|
    ProjectManager.destroy_all if ProjectManager.exists?
    environment = Rails.env
    type = case environment
      when "development" then "local"
      else "dropbox"
    end
    db_url_project_managers = case type
      when 'local' then"ProjectManagers.txt"
      when 'dropbox' then ENV["DROPBOX_LEGACY_DATA_URL_PROJECT_MANAGERS"]
    end
    ProjectManager.create!(
      manager_initials: "TBC",
      manager_firstname: 'I want to be updated',
      manager_lastname: 'mee too, mon',
      name: "nothing needed here")
    pms = ArrayContent.new(db_url_project_managers, true, type)
    sample_amount = args.sample_amount
    sample_amount = sample_amount.to_i
    project_managers = case sample_amount
    when 0
        pms.get_arr_of_arrs
      else
        pms.get_arr_of_arrs.sample(sample_amount)
    end
    project_managers.each do |row|
      ProjectManager.create!(
        manager_initials: row[0],
        manager_firstname: 'I want to be updated',
        manager_lastname: 'mee too, mon',
        name: row[1])
    end
    puts "#{ProjectManager.count} Project Managers created from #{pms.get_type}"
  end

end

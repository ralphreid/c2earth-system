require 'array_content'

namespace :project_manager do
  desc "Create project managers"
  task create_project_managers: :environment do
    ProjectManager.destroy_all if ProjectManager.exists?
    ProjectManager.create!(
      manager_initials: "TBC",
      manager_firstname: 'I want to be updated',
      manager_lastname: 'mee too, mon',
      name: "nothing needed here")
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

end

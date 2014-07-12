require 'array_content'

namespace :project do
  desc "Create project"
  task create_projects: :environment do
    Project.destroy_all if Project.exists?
    db_url_projects = 'projects.csv'
    pms = ArrayContent.new(db_url_projects, true, 'local')
    projects = pms.get_arr_of_arrs
    projects.each do |row|
      Project.create!(
        name: row[0],
        name_alternate: row[1],
        number: row[2],
        prefix: row[3],
        description: row[4]
        )
    end
    puts "#{Project.count} Projects created from #{pms.get_type}"
  end

end

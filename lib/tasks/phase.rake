require 'array_content'

namespace :phase do
  desc "Create phases"
  task create_phases: :environment do
    Phase.destroy_all if Phase.exists?
    db_url_phases = 'phases.csv'
    pms = ArrayContent.new(db_url_phases, true, 'local')
    phases = pms.get_arr_of_arrs
    phases.each do |row|
      p = Phase.create!(
        title: "Unknown - Legacy")
      # build project associations
      proj = Project.find_by name: row[0], name_alternate: row[1], number: row[2], prefix: row[3], description: row[4]
      unless proj.nil?
        proj.phases.push p
      end
      # build project manager associations
      manager = ProjectManager.find_by manager_initials: row[5]
      unless manager.nil?
        manager.phases.push p
      end
    end
    puts "#{Phase.count} Phases created from #{pms.get_type}"
  end

end

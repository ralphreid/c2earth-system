require 'array_content'

namespace :investigation_type do
  desc "Create faults"
  task create_investigation_types: :environment do
    InvestigationType.destroy_all if InvestigationType.exists?
    db_url_investigation_types = "ProjectsbyInvestigationType.txt"
    pms = ArrayContent.new(db_url_investigation_types, true, 'local')
    investigation_types = pms.get_arr_of_arrs
    investigation_types.each do |row|
      investigation_type_to_add = row [0]
      investigation_type_to_add.capitalize
      InvestigationType.create! investigation_type: investigation_type_to_add
    end
    puts "#{InvestigationType.count} Investigation Types created from #{pms.get_type}"
  end
end

require 'array_content'

namespace :investigation_type do
  desc "Create faults"
  task :create_investigation_types, [:sample_amount] => :environment do |t, args|
    InvestigationType.destroy_all if InvestigationType.exists?
    environment = Rails.env
    type = case environment
      when "development" then "local"
      else "dropbox"
    end
    type = 'dropbox'
    db_url_investigation_types = case type
    when 'local' then "ProjectsbyInvestigationType.txt"
    when 'dropbox' then Figaro.env.DROPBOX_LEGACY_DATA_URL_INVESTIGATION_TYPE
    end
    pms = ArrayContent.new(db_url_investigation_types, true, type)
    sample_amount = args.sample_amount
    sample_amount = sample_amount.to_i
    investigation_types = case sample_amount
      when 0
        pms.get_arr_of_arrs
      else
        pms.get_arr_of_arrs.sample(sample_amount)
    end
    investigation_types.each do |row|
      investigation_type_to_add = row [0]
      investigation_type_to_add.capitalize
      InvestigationType.create! investigation_type: investigation_type_to_add
    end
    puts "#{InvestigationType.count} Investigation Types created from #{pms.get_type}"
  end
end

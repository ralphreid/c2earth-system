require 'array_content'

namespace :company do
  desc "Create company"
  task :create_companies, [:sample_amount] => :environment do |t, args|
  Company.destroy_all if Company.exists?
  environment = Rails.env
  type = case environment
    when "development" then "local"
    else "dropbox"
  end
  db_url_companies = case type
    when 'local' then 'companies.csv'
    when 'dropbox' then ENV["DROPBOX_LEGACY_DATA_URL_COMPANIES"]
  end
  pms = ArrayContent.new(db_url_companies, true, type)
  sample_amount = args.sample_amount
  sample_amount = sample_amount.to_i
  companies = case sample_amount
  when 0
      pms.get_arr_of_arrs
    else
      pms.get_arr_of_arrs.sample(sample_amount)
  end
  companies.each do |row|
    c = Company.create!( name: row[1] )
    type_to_add = row[0]
    type_to_add.capitalize
    t = CompanyType.find_by name: type_to_add
    unless t.nil?
      c.company_types.push t
    end
  end
  puts "#{Company.count} Companies created from #{pms.get_type}"
  end

end

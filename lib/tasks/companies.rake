require 'array_content'

namespace :company do
  desc "Create companies"
  task create_companies: :environment do
    Company.destroy_all if Company.exists?
    db_url_companies = 'companies.csv'
    pms = ArrayContent.new(db_url_companies, true, 'local')
    companies = pms.get_arr_of_arrs
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

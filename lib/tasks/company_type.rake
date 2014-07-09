require 'array_content'

namespace :company_type do
  desc "Create company types"
  task create_company_types: :environment do
    CompanyType.destroy_all if CompanyType.exists?
    names = [
      "Structural",
      "Civil",
      "Surveying",
      "Architecture",
      "Legal",
      "TBC"
    ]
    names.each do |value|
      CompanyType.create!(name: value)
    end
    puts "#{CompanyType.count} Company Types created"
  end

end

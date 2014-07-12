require 'array_content'

namespace :stakeholder_type do
  desc "Create stakeholder types"
  task create_stakeholder_types: :environment do
    StakeholderType.destroy_all if StakeholderType.exists?
    names = [
      "survey",
      "structural",
      "civil",
      "surveying",
      "architecture",
      "attorney",
      "seller-info",
      "seller-agent",
      "seller-realestate",
      "buyer-from-all-data",
      "buyer-agent",
      "buyer-realestate",
    ]
    names.each do |value|
      StakeholderType.create!(name: value)
    end
    puts "#{StakeholderType.count} Stakeholder Types created from hardcoded array"
  end

end

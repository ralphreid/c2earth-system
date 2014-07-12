require 'array_content'

namespace :stakeholder do
  desc "Create stakeholder"
  task create_stakeholder: :environment do
    Stakeholder.destroy_all if Stakeholder.exists?
    db_url_stakeholders = 'company_stakeholders.csv'
    pms = ArrayContent.new(db_url_stakeholders, true, 'local')
    stakeholders = pms.get_arr_of_arrs
    stakeholders.each do |row|
      s = Stakeholder.create!(
        name: row[2],
        notes: row[3])
      t = StakeholderType.find_by name: row[0]
      unless t.nil?
        s.stakeholder_types.push t
      end
      c = Company.find_by name: row[1]
      unless c.nil?
        s.company = c
      end
      s.save!
    end
    puts "#{Stakeholder.count} Stakeholders created from #{pms.get_type}"

    db_url_stakeholders = 'stakeholders.csv'
    pms = ArrayContent.new(db_url_stakeholders, true, 'local')
    stakeholders = pms.get_arr_of_arrs
    stakeholders.each do |row|
      s = Stakeholder.find_by name: row[1]
      if s.nil?
        s = Stakeholder.create!(
          name: row[1])
        t = StakeholderType.find_by name: row[0]
        unless t.nil?
          s.stakeholder_types.push t
        end
      end
      s.save!
    end
    puts "#{Stakeholder.count} Stakeholders created from #{pms.get_type}"
  end

end

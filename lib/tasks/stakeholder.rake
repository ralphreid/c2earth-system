require 'array_content'

namespace :stakeholder do
  desc "Create stakeholder"
  task :create_stakeholders, [:sample_amount] => :environment do |t, args|
    Stakeholder.destroy_all if Stakeholder.exists?
    environment = Rails.env
    type = case environment
      when "development" then "local"
      else "dropbox"
    end
    db_url_stakeholders = case type
      when 'local' then 'company_stakeholders.csv'
      when 'dropbox' then ENV["DROPBOX_LEGACY_DATA_URL_COMPANY_STAKEHOLDERS"]
    end
    pms = ArrayContent.new(db_url_stakeholders, true, type)
    sample_amount = args.sample_amount
    sample_amount = sample_amount.to_i
    stakeholders = case sample_amount
    when 0
        pms.get_arr_of_arrs
      else
        pms.get_arr_of_arrs.sample(sample_amount)
    end
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

    db_url_stakeholders = case type
      when 'local' then "stakeholders.csv"
      when 'dropbox' then ENV["DROPBOX_LEGACY_DATA_URL_STAKEHOLDERS"]
    end
    pms = ArrayContent.new(db_url_stakeholders, true, type)
    sample_amount = args.sample_amount
    sample_amount = sample_amount.to_i
    stakeholders = case sample_amount
    when 0
        pms.get_arr_of_arrs
      else
        pms.get_arr_of_arrs.sample(sample_amount)
    end
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

require 'array_content'

namespace :site do
  desc "Create stites"
  task :create_sites, [:sample_amount] => :environment do |t, args|
    Site.destroy_all if Site.exists?
    environment = Rails.env

    type = case environment
      when "development" then "local"
      else "dropbox"
    end
    db_url_sites = case type
      when 'local' then "sites.txt"
      when 'dropbox' then Figaro.env.DROPBOX_LEGACY_DATA_URL_SITES
    end
    pms = ArrayContent.new(db_url_sites, true, type)
    sample_amount = args.sample_amount
    sample_amount = sample_amount.to_i
    sites = case sample_amount
    when 0
        pms.get_arr_of_arrs
      else
        pms.get_arr_of_arrs.sample(sample_amount)
    end
    sites.each do |row|
      unless row == ["TBC", "TBC", "TBC", "TBC", "TBC", "TBC", "TBC", "TBC", "TBC", "TBC", "TBC"]
        s = Site.create!(
          street_number: row[9],
          street_name: row[1],
          city: row[2],
          county: row[3],
          loc_page: row[4],
          loc_longitude: row[5],
          loc_latitude: row[6],
          apn: row[7],
          tombrobox: row[10],
          state_code: "CA",
          country_code: "USA"
          )
        structure_type_to_add = row[0]
        structure_type_to_add.split.map(&:capitalize).join(' ')
        st = StructureType.find_by name: structure_type_to_add
        unless st.nil?
          s.structure_types.push st
        end
        s.save!
      end
    end
    puts "#{Site.count} Sites created from #{pms.get_type}"
  end

end

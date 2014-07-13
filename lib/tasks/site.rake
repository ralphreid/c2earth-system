require 'array_content'

namespace :site do
  desc "Create stites"
  task create_sites: :environment do
    Site.destroy_all if Site.exists?
    db_url_sites = "sites.txt"
    pms = ArrayContent.new(db_url_sites, true, 'local')
    # sites = pms.get_arr_of_arrs.first(50)
    sites = pms.get_arr_of_arrs
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

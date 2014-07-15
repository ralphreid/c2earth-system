require 'array_content'

namespace :client_type do
  desc "Create client types"
  task create_client_types: :environment do
    ClientType.destroy_all if ClientType.exists?
    # db_url_client_types = "client_types.txt"
    # Figaro.env.google_maps_v3_api_key
    db_url_client_types = Figaro.env.DROPBOX_LEGACY_DATA_URL_CLIENT_TYPES
    ClientType.create!(name: 'TBC')
    pms = ArrayContent.new(db_url_client_types, true, 'dropbox')
    client_types = pms.get_arr_of_arrs
    client_types.each do |row|
      client_type_to_add = row[0]
      client_type_to_add.capitalize
      ClientType.create!(name: client_type_to_add)
    end
    puts "#{ClientType.count} client types exist and created from #{pms.get_type}"
  end

end

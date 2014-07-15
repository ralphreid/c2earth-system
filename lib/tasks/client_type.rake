require 'array_content'

namespace :client_type do
  desc "Create client types"
  task :create_client_types, [:type] => :environment do |t, args|
    ClientType.destroy_all if ClientType.exists?
    case args.type
      when 'local'
        db_url_client_types = "client_types.txt"
      when 'dropbox'
        db_url_client_types = Figaro.env.DROPBOX_LEGACY_DATA_URL_CLIENT_TYPES
    end
    ClientType.create!(name: 'TBC')
    pms = ArrayContent.new(db_url_client_types, true, args.type)
    client_types = pms.get_arr_of_arrs
    client_types.each do |row|
      client_type_to_add = row[0]
      client_type_to_add.capitalize
      ClientType.create!(name: client_type_to_add)
    end
    puts "#{ClientType.count} client types exist and created from #{pms.get_type}"
  end

end

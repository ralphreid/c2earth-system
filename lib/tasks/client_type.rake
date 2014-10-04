require 'array_content'

namespace :client_type do
  desc "Create client types"
  task :create_client_types, [:sample_amount] => :environment do |t, args|
    ClientType.destroy_all if ClientType.exists?
    # environment = Rails.env
    # type = case environment
    #   when "development" then "local"
    #   else "dropbox"
    # end

    if Rails.env.development?
      type = 'local'
    else
      type = 'dropbox'
    end
    
    db_url_client_types = case type
      when 'local' then "client_types.txt"
      when 'dropbox' then ENV["DROPBOX_LEGACY_DATA_URL_CLIENT_TYPES"].dup
    end

    ClientType.create!(name: 'TBC')
    pms = ArrayContent.new(db_url_client_types, true, type)
    sample_amount = args.sample_amount
    sample_amount = sample_amount.to_i
    client_types = case sample_amount
    when 0
        pms.get_arr_of_arrs
      else
        pms.get_arr_of_arrs.sample(sample_amount)
    end
    client_types.each do |row|
      client_type_to_add = row[0]
      client_type_to_add.capitalize
      ClientType.create!(name: client_type_to_add)
    end
    puts "#{ClientType.count} client types exist and created from #{pms.get_type}"
  end

end

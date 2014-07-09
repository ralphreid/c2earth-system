require 'array_content'

namespace :client do
  desc "Create clients"
  task create_clients: :environment do
    Client.destroy_all if Client.exists?
    db_url_clients = 'clients.txt'
    pms = ArrayContent.new(db_url_clients, true, 'local')
    clients = pms.get_arr_of_arrs
    clients.each do |row|
      c = Client.create!(
        name: row[2],
        name_alternate: row[3],
        address: row[4],
        city: row[5],
        state: row[6],
        zip: row[7],
        work_phone: row[8],
        home_phone: row[9],
        cell_phone: row[10],
        fax_phone: row[11],
        email: row[12],
        address_alternate: row[13],
        city_alternate: row[14],
        state_alternate: row[15],
        zip_alternate: row[16],
        work_phone_alternate: row[17],
        home_phone_alternate: row[18],
        cell_phone_alternate: row[19],
        fax_phone_alternate: row[20],
        email_alternate: row[21],
        notes: row[22]
      )
      c.save!
      client_type_to_add = row[0]
      client_type_to_add.capitalize
      ct = ClientType.find_by name: client_type_to_add
      unless ct.nil?
        c.client_types.push ct
      end
      c.save!
      client_type_to_add = row[1]
      client_type_to_add.capitalize
      ct = ClientType.find_by name: client_type_to_add
      unless ct.nil? or ct.name == "TBC"
        c.client_types.push ct
      end
      c.save!
    end
    puts "#{Client.count} client types exist and created from #{pms.get_type}"
  end

end

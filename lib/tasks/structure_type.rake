require 'array_content'

namespace :structure_type do
  desc "Create structure types"
  task :create_structure_types, [:sample_amount] => :environment do |t, args|
    StructureType.destroy_all if StructureType.exists?
    StructureType.create!(name: 'TBC')
    StructureType.create!(name: "Barn Or Water Tower")
    StructureType.create!(name: "Pipeline For Water")
    StructureType.create!(name: "Single Family Home")
    StructureType.create!(name: "Condo Or Townhouse")
    environment = Rails.env
    type = case environment
      when "development" then "local"
      else "dropbox"
    end
    db_url_structure_types = case type
      when 'local' then "structure_types.txt"
      when 'dropbox' then Figaro.env.DROPBOX_LEGACY_DATA_URL_STRUCTURE_TYPES
    end
    pms = ArrayContent.new(db_url_structure_types, true, type)
    sample_amount = args.sample_amount
    sample_amount = sample_amount.to_i
    structure_types = case sample_amount
    when 0
        pms.get_arr_of_arrs
      else
        pms.get_arr_of_arrs.sample(sample_amount)
    end
    structure_types.each do |row|
      structure_type_to_add = row[0]
      structure_type_to_add.split.map(&:capitalize).join(' ')
      StructureType.create! name: structure_type_to_add
    end
    puts "#{StructureType.count} Structure Types created from #{pms.get_type}"
  end

end

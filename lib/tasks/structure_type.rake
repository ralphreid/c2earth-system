require 'array_content'

namespace :structure_type do
  desc "Create structure types"
  task create_structure_types: :environment do
    StructureType.destroy_all if StructureType.exists?
    StructureType.create!(name: 'TBC')
    StructureType.create!(name: "Barn Or Water Tower")
    StructureType.create!(name: "Pipeline For Water")
    StructureType.create!(name: "Single Family Home")
    StructureType.create!(name: "Condo Or Townhouse")
    db_url_structure_types = "structure_types.txt"
    pms = ArrayContent.new(db_url_structure_types, true, 'local')
    structure_types = pms.get_arr_of_arrs
    structure_types.each do |row|
      structure_type_to_add = row[0]
      structure_type_to_add.split.map(&:capitalize).join(' ')
      StructureType.create! name: structure_type_to_add
    end
    puts "#{StructureType.count} Structure Types created from #{pms.get_type}"
  end

end

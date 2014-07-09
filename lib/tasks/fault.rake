require 'array_content'

namespace :fault do
  desc "Create faults"
  task create_faults: :environment do
    Fault.destroy_all if Fault.exists?
      fault_names =
      ["Berrocal",
      "Berryessa",
      "Calaveras",
      "Crosley",
      "Hayward",
      "Monte Vista",
      "N/A",
      "San Andreas",
      "Shannon",
      "Zyanti"]
    fault_names.each do |value|
      Fault.create! name: value
    end
    puts "#{Fault.count} Faults created from hardcoded array"
  end

end

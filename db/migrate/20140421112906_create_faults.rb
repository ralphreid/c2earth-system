class CreateFaults < ActiveRecord::Migration
  def change
    create_table :faults do |t|
      t.string :name

      t.timestamps
    end
  end
end

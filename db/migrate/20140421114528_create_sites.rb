class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :number
      t.integer :structure_type_id
      t.string :address
      t.string :city
      t.string :county
      t.text :loc_page
      t.decimal :loc_longitude
      t.decimal :loc_latitude
      t.string :apn
      t.string :tombrobox
      t.integer :fault_id

      t.timestamps
    end
  end
end

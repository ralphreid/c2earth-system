class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :street_number
      t.string :street_name
      t.string :address
      t.string :city
      t.string :county
      t.text :loc_page
      t.decimal :loc_longitude
      t.decimal :loc_latitude
      t.string :apn
      t.string :tombrobox
      t.belongs_to :fault

      t.timestamps
    end
  end
end

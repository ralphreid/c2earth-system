class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :contact
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :phone
      t.string :fax
      t.string :email
      t.text :website
      t.text :notes

      t.timestamps
    end
  end
end

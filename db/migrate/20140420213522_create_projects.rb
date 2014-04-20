class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :name_alternate
      t.string :number
      t.integer :prefix_id
      t.text :description

      t.timestamps
    end
  end
end

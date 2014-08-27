class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :site_id
      t.integer :project_id

      t.timestamps
    end
  end
end

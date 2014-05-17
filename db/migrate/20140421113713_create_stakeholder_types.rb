class CreateStakeholderTypes < ActiveRecord::Migration
  def change
    create_table :stakeholder_types do |t|
      t.string :name

      t.timestamps
    end
  end
end

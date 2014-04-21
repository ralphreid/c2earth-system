class CreateStakeholderTypes < ActiveRecord::Migration
  def change
    create_table :stakeholder_types do |t|
      t.string :stakeholder_type

      t.timestamps
    end
  end
end

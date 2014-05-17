class CreateJoinTableStakeholderStakeholderType < ActiveRecord::Migration
  def change
    create_join_table :stakeholder_types, :stakeholders do |t|
      t.index [:stakeholder_id, :stakeholder_type_id], unique: true, name: 'by_stake_stake_type' 
      t.index [:stakeholder_type_id, :stakeholder_id], unique: true, name: 'by_stake_type_stake'
    end
  end
end

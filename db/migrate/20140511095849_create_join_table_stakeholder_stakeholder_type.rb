class CreateJoinTableStakeholderStakeholderType < ActiveRecord::Migration
  def change
    create_join_table :stakeholders, :stakeholder_types do |t|
      t.index [:stakeholder_id, :stakeholder_type_id], unique: true, name: 'by_stake_stake_type' 
      t.index [:stakeholder_type_id, :stakeholder_id], unique: true, name: 'by_stake_type_stake'
    end
  end
end

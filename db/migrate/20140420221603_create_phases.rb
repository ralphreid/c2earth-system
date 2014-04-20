class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.string :phase
      t.integer :project_id
      t.integer :company_id
      t.integer :project_manager_id
      t.string :investigation_type_id
      t.integer :site_id
      t.integer :stakeholder_id
      t.text :description
      t.date :proposal_date
      t.string :proposal_number
      t.date :report_date
      t.text :notes
      t.string :insurance_policy_number
      t.text :insurance_notes
      t.string :bill_name
      t.string :bill_attention
      t.string :bill_address
      t.string :bill_city
      t.string :bill_state
      t.string :bill_zip
      t.text :bad_pay_history
      t.string :keywords

      t.timestamps
    end
  end
end

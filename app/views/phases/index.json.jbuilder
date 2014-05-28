json.array!(@phases) do |phase|
  json.extract! phase, :id, :title, :project_id, :company_id, :project_manager_id, :investigation_type_id, :site_id, :stakeholder_id, :description, :proposal_date, :proposal_number, :report_date, :notes, :insurance_policy_number, :insurance_notes, :bill_name, :bill_attention, :bill_address, :bill_city, :bill_state, :bill_zip, :bad_pay_history, :keywords
  json.url phase_url(phase, format: :json)
end

json.array!(@stakeholder_types) do |stakeholder_type|
  json.extract! stakeholder_type, :id, :name
  json.url stakeholder_type_url(stakeholder_type, format: :json)
end

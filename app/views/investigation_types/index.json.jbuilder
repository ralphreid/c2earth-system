json.array!(@investigation_types) do |investigation_type|
  json.extract! investigation_type, :id, :investigation_type
  json.url investigation_type_url(investigation_type, format: :json)
end

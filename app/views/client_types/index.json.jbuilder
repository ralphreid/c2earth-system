json.array!(@client_types) do |client_type|
  json.extract! client_type, :id, :client_type
  json.url client_type_url(client_type, format: :json)
end
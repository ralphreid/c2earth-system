json.array!(@structure_types) do |structure_type|
  json.extract! structure_type, :id, :structure_type
  json.url structure_type_url(structure_type, format: :json)
end

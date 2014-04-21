json.array!(@faults) do |fault|
  json.extract! fault, :id, :name
  json.url fault_url(fault, format: :json)
end

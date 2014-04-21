json.array!(@sites) do |site|
  json.extract! site, :id, :number, :structure_type_id, :address, :city, :county, :loc_page, :loc_longitude, :loc_latitude, :apn, :tombrobox, :fault_id
  json.url site_url(site, format: :json)
end

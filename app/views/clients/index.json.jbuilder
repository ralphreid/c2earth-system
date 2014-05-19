json.array!(@clients) do |client|
  json.extract! client, :id, :name, :name_alternate, :address, :city, :state, :zip, :work_phone, :home_phone, :cell_phone, :fax_phone, :email, :address_alternate, :city_alternate, :state_alternate, :zip_alternate, :work_phone_alternate, :home_phone_alternate, :cell_phone_alternate, :fax_phone_alternate, :email_alternate, :notes
  json.url client_url(client, format: :json)
end

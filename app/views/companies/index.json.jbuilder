json.array!(@companies) do |company|
  json.extract! company, :id, :company_name, :contact, :address, :city, :state, :zip, :phone, :fax, :email, :website, :notes
  json.url company_url(company, format: :json)
end

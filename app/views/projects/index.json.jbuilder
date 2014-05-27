json.array!(@projects) do |project|
  json.extract! project, :id, :name, :name_alternate, :number, :prefix, :description
  json.url project_url(project, format: :json)
end

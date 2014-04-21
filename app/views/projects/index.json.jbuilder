json.array!(@projects) do |project|
  json.extract! project, :id, :name, :name_alternate, :number, :prefix_id, :description
  json.url project_url(project, format: :json)
end

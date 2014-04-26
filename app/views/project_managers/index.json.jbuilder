json.array!(@project_managers) do |project_manager|
  json.extract! project_manager, :id, :manager_initials, :name, :manager_firstname
:manager_lastname
  json.url project_manager_url(project_manager, format: :json)
end

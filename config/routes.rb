C2earthSystem::Application.routes.draw do
  resources :clients

  resources :company_types

  resources :investigation_types

  resources :structure_types

  resources :sites, module: :sites do
    #   ... get closed_down   localhost/sites/1/closed_down
    member do
      resources :projects
      resources :activities
      #get 'projects'
    end

    collection do
      get 'lookup_address'   #localhost/sites/lookup_address
    end
  end

  resources :stakeholder_types

  resources :faults

  resources :companies

  resources :stakeholders

  resources :client_types

  resources :project_managers

  resources :phases

  resources :projects

  root "pages#home"
  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  get "map", to: "pages#map", as: "map"


  devise_for :users

  namespace :admin do
    root "base#index"
    resources :users
  end

end

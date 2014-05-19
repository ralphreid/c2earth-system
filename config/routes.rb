C2earthSystem::Application.routes.draw do
  resources :clients

  resources :company_types

  resources :investigation_types

  resources :structure_types

  resources :sites

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
  
    
  devise_for :users
  
  namespace :admin do
    root "base#index"
    resources :users
  end
  
end

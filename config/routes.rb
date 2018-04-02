Rails.application.routes.draw do
  resources :agents, only: [:index]
  resources :events
  resources :organizations
  resources :pages
  resources :people
  resources :places
  resources :works
  resources :nodes
  resources :edges
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

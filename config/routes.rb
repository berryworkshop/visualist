Rails.application.routes.draw do
  resources :works
  resources :places
  resources :organizations
  resources :people
  resources :edges
  resources :nodes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :events
  resources :works
  resources :places
  resources :organizations
  resources :people
  resources :edges
  resources :pages
  resources :nodes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

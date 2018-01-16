Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'

  jsonapi_resources :events
  jsonapi_resources :organizations
  jsonapi_resources :pages
  jsonapi_resources :people
  jsonapi_resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

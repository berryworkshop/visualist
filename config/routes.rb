Rails.application.routes.draw do
  resources :relations
  resources :events
  resources :things
  post 'user_token' => 'user_token#create'

  jsonapi_resources :users
  jsonapi_resources :pages


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

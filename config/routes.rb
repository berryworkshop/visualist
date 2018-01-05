Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'

  namespace :api do
    jsonapi_resources :users
    jsonapi_resources :pages
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

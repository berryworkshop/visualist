Rails.application.routes.draw do
  # jsonapi_resources :articles
  # jsonapi_resources :books
  # jsonapi_resources :emails
  jsonapi_resources :events
  # jsonapi_resources :images
  # jsonapi_resources :licenses
  # jsonapi_resources :locations
  # jsonapi_resources :organizations
  jsonapi_resources :pages
  # jsonapi_resources :people
  # jsonapi_resources :phones
  # jsonapi_resources :places
  # jsonapi_resources :sites
  # jsonapi_resources :snippets
  # jsonapi_resources :social_accounts
  # jsonapi_resources :sources
  # jsonapi_resources :terms
  # jsonapi_resources :time_periods
  jsonapi_resources :users
  # jsonapi_resources :websites
  # jsonapi_resources :works

  post 'user_token' => 'user_token#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

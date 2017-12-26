Rails.application.routes.draw do

  get 'main/index'

  scope '/api' do
    resources :events
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

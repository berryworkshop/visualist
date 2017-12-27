Rails.application.routes.draw do

  scope path: 'api' do
    resources :events
  end

  get '*path', to: 'main#index'

end

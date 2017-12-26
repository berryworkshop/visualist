Rails.application.routes.draw do

  scope '/api' do
    resources :events
  end

  get '*path', to: 'main#index'

end

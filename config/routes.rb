Rails.application.routes.draw do

  root to: 'spa#index'

  namespace :api do
    get '/', to: 'base#index'

    resources :events
  end

  get '*path', to: 'spa#index'

end

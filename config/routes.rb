Rails.application.routes.draw do

  namespace :api do
    get '/', to: 'base#index'

    resources :events
  end

  get '*path', to: 'spa#index'

end

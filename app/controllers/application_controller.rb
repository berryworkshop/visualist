class ApplicationController < ActionController::API
  include JSONAPI::ActsAsResourceController
  include Knock::Authenticable
  before_action :set_location, only: [:show, :update, :destroy]

  # protect_from_forgery with: :null_session
end

class ApplicationController < ActionController::API
  include JSONAPI::ActsAsResourceController
  # include Knock::Authenticable

  # not sure what the following is; delete after tests complete
  # before_action :set_location, only: [:show, :update, :destroy]

  # protect_from_forgery with: :null_session
end

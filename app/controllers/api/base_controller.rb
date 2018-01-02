class Api::BaseController < ApplicationController

  # GET /
  def index
    render json: {
      events: 'http://example.com'
    }
  end

end

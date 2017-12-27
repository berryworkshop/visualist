class SpaController < ActionController::Base

  # GET /* (catch all, for SPA)
  def index
    render file: 'public/index.html'
  end
end

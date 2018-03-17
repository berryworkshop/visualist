require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest

  def json_response
    ActiveSupport::JSON.decode @response.body
  end
end

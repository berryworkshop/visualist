require 'test_helper'

class AgentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    nil
  end

  test "should get index" do
    get agents_url, as: :json
    assert_response :success
  end

  test "index should show both people and organizations" do
    get agents_url, as: :json
    r = JSON.parse(@response.body)

    assert_equal r['data'].length, 6
  end
end

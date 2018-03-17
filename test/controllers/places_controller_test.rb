require 'test_helper'

class PlacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @place = places(:grant_park)
  end

  # TODO refactor into module
  def json_response
    ActiveSupport::JSON.decode @response.body
  end

  test "should get index" do
    get places_url, as: :json
    assert_response :success
  end

  test "should create place" do
    assert_difference('Place.count') do
      post places_url, params: {
        attributes: {
          type: "Place",
          slug: "test_place",
          title: "A Place",
          body: "This is a body.",
          properties: '{"valid": "json"}'
        }
      }, as: :json
    end

    assert_response 201
  end

  test "should show place" do
    get place_url(@place), as: :json
    assert_response :success
  end

  test "place type should be place" do
    get place_url(@place), as: :json
    assert_equal "place", json_response['data']['type']
  end

  test "should update place" do
    patch place_url(@place), params: {
      attributes: {
        body: "This is a new place."
      }
    }, as: :json
    assert_response 200
  end

  test "should destroy place" do
    assert_difference('Place.count', -1) do
      delete place_url(@place), as: :json
    end

    assert_response 204
  end
end

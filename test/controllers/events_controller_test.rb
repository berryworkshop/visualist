require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:test_exhibition)
  end

  test "should get index" do
    get events_url, as: :json
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post events_url, params: {
        attributes: {
          type: "Event",
          slug: "groovy_exhibition",
          title: "A Groovy Exhibition",
          body: "A good time.",
          properties: nil,
        }
      }, as: :json
    end

    assert_response 201
  end

  test "should show event" do
    get event_url(@event), as: :json
    assert_response :success
  end

  test "should update event" do
    patch event_url(@event), params: {
      attributes: {
        body: "This is a new event description."
      }
    }, as: :json
    assert_response 200
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete event_url(@event), as: :json
    end

    assert_response 204
  end

  test "index should only show events" do
    get events_url, as: :json
    r = JSON.parse(@response.body)

    assert_equal r['data'].length, 2
  end

end

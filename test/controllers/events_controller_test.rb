require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  def headers
    token = Knock::AuthToken.new(
      payload: {
        sub: users(:valid).id
      }
    ).token
    {
      Authorization: "Bearer #{token}",
      CONTENT_TYPE: JSONAPI::MEDIA_TYPE
    }
  end

  setup do
    @event = events(:exhibition)
  end

  test 'should get index' do
    get events_url, as: 'application/vnd.api+json'
    assert_response :success
  end

  test 'should create event' do
    assert_difference('Event.count') do
      post events_url, params: {
        data: {
          type: 'events',
          attributes: {
            name: @event.name,
            body: @event.body
          }
        }
      }.to_json,
      headers: headers
    end

    assert_response 201
  end

  test 'should show event' do
    get event_url(@event), headers: headers
    assert_response :success
  end

  test 'should update event' do
    patch event_url(@event), params: {
        data: {
          type: 'events',
          id: @event.id,
          attributes: {
            name: "Different Name",
            body: "A different body text."
          }
        }
      }.to_json,
      headers: headers
    assert_response 200
  end

  test 'should destroy event' do
    assert_difference('Event.count', -1) do
      delete event_url(@event),
        headers: headers
    end

    assert_response 204
  end
end

require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  def authenticated_header
    token = Knock::AuthToken.new(payload: { sub: users(:one).id }).token
    {
      'Authorization': "Bearer #{token}"
    }
  end

  setup do
    @event = events(:one)
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
      },
      as: 'application/vnd.api+json',
      headers: authenticated_header
    end

    assert_response 201
  end

  test 'should show event' do
    get event_url(@event), as: 'application/vnd.api+json'
    assert_response :success
  end

  # test 'should update event' do
  #   patch event_url(@event), params: { event: { body: @event.body, categories: @event.categories, name: @event.name, status: @event.status } }, as: :json
  #   assert_response 200
  # end

  # test 'should destroy event' do
  #   assert_difference('Event.count', -1) do
  #     delete event_url(@event), as: :json
  #   end

  #   assert_response 204
  # end
end

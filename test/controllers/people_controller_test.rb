require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  def headers
    token = Knock::AuthToken.new(payload: { sub: users(:valid_user).id }).token
    {
      Authorization: "Bearer #{token}",
      CONTENT_TYPE: JSONAPI::MEDIA_TYPE
    }
  end

  setup do
    @person = people(:allan)
    @user = users(:valid_user)
  end

  test 'should get index' do
    get people_url, as: 'application/vnd.api+json'
    assert_response :success
  end

end

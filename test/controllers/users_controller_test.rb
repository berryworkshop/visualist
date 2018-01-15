require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def headers
    token = Knock::AuthToken.new(payload: { sub: users(:valid_user).id }).token
    {
      Authorization: "Bearer #{token}",
      CONTENT_TYPE: JSONAPI::MEDIA_TYPE
    }
  end

  setup do
    @user = users(:valid_user)
  end

  test 'should get index' do
    get users_url, as: 'application/vnd.api+json'
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      post users_url, params: {
        data: {
          type: 'users',
          attributes: {
            name: @user.name,
            email: @user.email,
            password: "secretpassword"
          }
        }
      }.to_json,
      headers: headers
    end

    assert_response 201
  end

  test 'should show user' do
    get user_url(@user), headers: headers
    assert_response :success
  end

  test 'should update user' do
    patch user_url(@user), params: {
        data: {
          type: 'users',
          id: @user.id,
          attributes: {
            name: "Different Name",
            email: "anotheremail@example.com"
          }
        }
      }.to_json,
      headers: headers
    assert_response 200
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) do
      delete user_url(@user),
        headers: headers
    end

    assert_response 204
  end
end

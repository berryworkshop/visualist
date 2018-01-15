require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  def headers
    token = Knock::AuthToken.new(payload: { sub: users(:valid_user).id }).token
    {
      Authorization: "Bearer #{token}",
      CONTENT_TYPE: JSONAPI::MEDIA_TYPE
    }
  end

  setup do
    @page = pages(:one)
    @user = users(:valid_user)
  end

  test 'should get index' do
    get pages_url, as: 'application/vnd.api+json'
    assert_response :success
  end

  test 'should create page' do
    assert_difference('Page.count') do
      post pages_url, params: {
        data: {
          type: 'pages',
          attributes: {
            name: @page.name,
            body: @page.body
          },
          relationships: {
            user: {
              data: {
                type: 'users',
                id: @user.id
              }
            }
          }
        }
      }.to_json,
      headers: headers
    end

    assert_response 201
  end

  test 'should show page' do
    get page_url(@page), headers: headers
    assert_response :success
  end

  test 'should update page' do
    patch page_url(@page), params: {
        data: {
          type: 'pages',
          id: @page.id,
          attributes: {
            name: "Different Name",
            body: "A different body text."
          }
        }
      }.to_json,
      headers: headers
    assert_response 200
  end

  test 'should destroy page' do
    assert_difference('Page.count', -1) do
      delete page_url(@page),
        headers: headers
    end

    assert_response 204
  end
end

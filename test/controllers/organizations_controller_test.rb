require 'test_helper'

class OrganizationsControllerTest < ActionDispatch::IntegrationTest
  def headers
    token = Knock::AuthToken.new(payload: { sub: users(:valid_user).id }).token
    {
      Authorization: "Bearer #{token}",
      CONTENT_TYPE: JSONAPI::MEDIA_TYPE
    }
  end

  setup do
    @organization = organizations(:culturemath)
    @user = users(:valid_user)
  end

  test 'should get index' do
    get organizations_url, as: 'application/vnd.api+json'
    assert_response :success
  end

end

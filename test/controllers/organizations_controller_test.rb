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

  # test 'should create organization' do
  #   assert_difference('Organization.count') do
  #     post organizations_url, params: {
  #       data: {
  #         type: 'organizations',
  #         attributes: {
  #           name: @organization.name,
  #           body: @organization.body
  #         },
  #         relationships: {
  #           user: {
  #             data: {
  #               type: 'users',
  #               id: @user.id
  #             }
  #           }
  #         }
  #       }
  #     }.to_json,
  #     headers: headers
  #   end

  #   assert_response 201
  # end

  # test 'should show organization' do
  #   get organization_url(@organization), headers: headers
  #   assert_response :success
  # end

  # test 'should update organization' do
  #   patch organization_url(@organization), params: {
  #       data: {
  #         type: 'organizations',
  #         id: @organization.id,
  #         attributes: {
  #           name: "Different Name",
  #           body: "A different body text."
  #         }
  #       }
  #     }.to_json,
  #     headers: headers
  #   assert_response 200
  # end

  # test 'should destroy organization' do
  #   assert_difference('Organization.count', -1) do
  #     delete organization_url(@organization),
  #       headers: headers
  #   end

  #   assert_response 204
  # end
end

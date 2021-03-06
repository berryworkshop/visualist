require 'test_helper'

class OrganizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization = organizations(:aic)
  end

  # TODO refactor into module
  def json_response
    ActiveSupport::JSON.decode @response.body
  end

  test "should get index" do
    get organizations_url, as: :json
    assert_response :success
  end

  test "should create organization" do
    assert_difference('Organization.count') do
      post organizations_url, params: {
        attributes: {
          type: "Organization",
          slug: "test_organization",
          title: "A Title",
          body: "This is a body.",
          properties: {}
        }
      }, as: :json
    end

    assert_response 201
  end

  test "should show organization" do
    get organization_url(@organization), as: :json
    assert_response :success
  end

  test "organization type should be node" do
    get organization_url(@organization), as: :json
    assert_equal "node", json_response['data']['type']
  end

  test "organization label should be Organization" do
    get organization_url(@organization), as: :json

    assert_equal "Organization", json_response['data']['attributes']['label']
  end

  test "should update organization" do
    patch organization_url(@organization), params: {
      attributes: {
        body: "This is a new org."
      }
    }, as: :json
    assert_response 200
  end

  test "should destroy organization" do
    assert_difference('Organization.count', -1) do
      delete organization_url(@organization), as: :json
    end

    assert_response 204
  end
end

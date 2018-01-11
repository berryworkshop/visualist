require 'test_helper'

class LicensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @license = licenses(:one)
  end

  test "should get index" do
    get licenses_url, as: :json
    assert_response :success
  end

  test "should create license" do
    assert_difference('License.count') do
      post licenses_url, params: { license: { name: @license.name, url: @license.url } }, as: :json
    end

    assert_response 201
  end

  test "should show license" do
    get license_url(@license), as: :json
    assert_response :success
  end

  test "should update license" do
    patch license_url(@license), params: { license: { name: @license.name, url: @license.url } }, as: :json
    assert_response 200
  end

  test "should destroy license" do
    assert_difference('License.count', -1) do
      delete license_url(@license), as: :json
    end

    assert_response 204
  end
end

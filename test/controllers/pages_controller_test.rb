require 'test_helper'

class PageControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page = pages(:about)
  end

  # TODO refactor into module
  def json_response
    ActiveSupport::JSON.decode @response.body
  end

  test "should get index" do
    get pages_url, as: :json
    assert_response :success
  end

  test "should create page" do
    assert_difference('Page.count') do
      post pages_url, params: {
        attributes: {
          type: "Page",
          slug: "test_page",
          title: "A Test Page",
          body: "A nice page.",
          properties: {}
        }
      }, as: :json
    end

    assert_response 201
  end

  test "should show page" do
    get page_url(@page), as: :json
    assert_response :success
  end

  test "page type should be node" do
    get page_url(@page), as: :json
    assert_equal "node", json_response['data']['type']
  end

  test "page label should be Event" do
    get page_url(@page), as: :json

    assert_equal "Page", json_response['data']['attributes']['label']
  end

  test "should update page" do
    patch page_url(@page), params: {
      attributes: {
        body: "This is a new page description."
      }
    }, as: :json
    assert_response 200
  end

  test "should destroy page" do
    assert_difference('Page.count', -1) do
      delete page_url(@page), as: :json
    end

    assert_response 204
  end
end

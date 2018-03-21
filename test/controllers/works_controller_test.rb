require 'test_helper'

class WorksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work = works(:american_gothic)
  end

  # TODO refactor into module
  def json_response
    ActiveSupport::JSON.decode @response.body
  end

  test "should get index" do
    get works_url, as: :json
    assert_response :success
  end

  test "should create work" do
    assert_difference('Work.count') do
      post works_url, params: {
        attributes: {
          type: "Work",
          slug: "untitled",
          title: "Untitled",
          body: "The most boring of works.",
          properties: '{}'
        }
      }, as: :json
    end

    assert_response 201
  end

  test "should show work" do
    get work_url(@work), as: :json
    assert_response :success
  end

  test "work type should be node" do
    get work_url(@work), as: :json
    assert_equal "node", json_response['data']['type']
  end

  test "work label should be Work" do
    get work_url(@work), as: :json

    assert_equal "Work", json_response['data']['attributes']['label']
  end

  test "should update work" do
    patch work_url(@work), params: {
      attributes: {
        body: "This is a revised body."
      }
    }, as: :json
    assert_response 200
  end

  test "should destroy work" do
    assert_difference('Work.count', -1) do
      delete work_url(@work), as: :json
    end

    assert_response 204
  end
end

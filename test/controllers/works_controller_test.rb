require 'test_helper'

class WorksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work = works(:american_gothic)
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
          properties: nil,
        }
      }, as: :json
    end

    assert_response 201
  end

  test "should show work" do
    get work_url(@work), as: :json
    assert_response :success
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

require 'test_helper'

class NodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @allan = people(:berry_allan)
  end

  test "should get index" do
    get nodes_url, as: :json
    assert_response :success
  end

  test "should create node" do
    assert_difference('Node.count') do
      post nodes_url, params: {
        attributes: {
          type: "Person",
          slug: "test_slug",
          title: "A Title",
          body: "This is a body.",
          properties: nil,
        }
      }, as: :json
    end

    assert_response 201
  end

  test "should show node" do
    get node_url(@allan), as: :json
    assert_response :success
  end

  test "should update node" do
    patch node_url(@allan), params: {
      attributes: {
        body: "This is some new text for the body.",
      }
    }, as: :json
    assert_response 200
  end

  test "should destroy node" do
    assert_difference('Node.count', -1) do
      delete node_url(@allan), as: :json
    end

    assert_response 204
  end
end

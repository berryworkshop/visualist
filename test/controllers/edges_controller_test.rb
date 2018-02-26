require 'test_helper'

class EdgesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @edge = edges(:allan_friend_meg)
  end

  test "should get index" do
    get edges_url, as: :json
    assert_response :success
  end

  test "should create edge" do
    allan = Node.find_by(slug: :berry_allan)

    assert_difference('Edge.count') do
      post edges_url, params: {
        edge: {
          subject_id: allan.id,
          predicate: :has_friend,
          dobject_id: allan.id,
        }
      }, as: :json
    end

    assert_response 201
  end

  test "should show edge" do
    get edge_url(@edge), as: :json
    assert_response :success
  end

  test "should update edge" do
    meg = Node.find_by(slug: :duguid_meg)

    patch edge_url(@edge), params: {
      edge: {
        subject_id: meg.id,
        predicate: @edge.predicate,
        dobject_id: meg.id,
      }
    }, as: :json
    assert_response 200
  end

  test "should destroy edge" do
    assert_difference('Edge.count', -1) do
      delete edge_url(@edge), as: :json
    end

    assert_response 204
  end
end

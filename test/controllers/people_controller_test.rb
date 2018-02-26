require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:berry_allan)
  end

  test "should get index" do
    get people_url, as: :json
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post nodes_url, params: {
        node: {
          type: "Person",
          slug: "smith_john",
          title: "Smith, John",
          body: "A swell fellow.",
          properties: nil,
        }
      }, as: :json
    end

    assert_response 201
  end

  test "should show person" do
    get person_url(@person), as: :json
    assert_response :success
  end

  test "should update person" do
    patch person_url(@person), params: {
      node: {
        body: "This is a new person description."
      }
    }, as: :json
    assert_response 200
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete person_url(@person), as: :json
    end

    assert_response 204
  end
end

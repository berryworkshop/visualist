require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:berry_allan)
  end

  # TODO refactor into module
  def json_response
    ActiveSupport::JSON.decode @response.body
  end

  test "should get index" do
    get people_url, as: :json
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post people_url, params: {
        attributes: {
          type: "Person",
          slug: "smith_john",
          title: "Smith, John",
          body: "A swell fellow.",
          properties: {}
        }
      }, as: :json
    end

    assert_response 201
  end

  test "should show person" do
    get person_url(@person), as: :json
    assert_response :success
  end

  test "person type should be node" do
    get person_url(@person), as: :json
    assert_equal "node", json_response['data']['type']
  end

  test "person label should be Person" do
    get person_url(@person), as: :json

    assert_equal "Person", json_response['data']['attributes']['label']
  end

  test "should update person" do
    patch person_url(@person), params: {
      attributes: {
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

  test "index should only show people" do
    get people_url, as: :json
    r = JSON.parse(@response.body)

    assert_equal r['data'].length, 4
  end
end

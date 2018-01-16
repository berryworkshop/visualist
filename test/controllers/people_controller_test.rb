require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  def headers
    token = Knock::AuthToken.new(payload: { sub: users(:valid_user).id }).token
    {
      Authorization: "Bearer #{token}",
      CONTENT_TYPE: JSONAPI::MEDIA_TYPE
    }
  end

  setup do
    @person = people(:allan)
    @user = users(:valid_user)
  end

  test 'should get index' do
    get people_url, as: 'application/vnd.api+json'
    assert_response :success
  end

  # test 'should create person' do
  #   assert_difference('Person.count') do
  #     post people_url, params: {
  #       data: {
  #         type: 'people',
  #         attributes: {
  #           name: @person.name,
  #           body: @person.body
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

  # test 'should show person' do
  #   get person_url(@person), headers: headers
  #   assert_response :success
  # end

  # test 'should update person' do
  #   patch person_url(@person), params: {
  #       data: {
  #         type: 'people',
  #         id: @person.id,
  #         attributes: {
  #           name: "Different Name",
  #           body: "A different body text."
  #         }
  #       }
  #     }.to_json,
  #     headers: headers
  #   assert_response 200
  # end

  # test 'should destroy person' do
  #   assert_difference('Person.count', -1) do
  #     delete person_url(@person),
  #       headers: headers
  #   end

  #   assert_response 204
  # end
end

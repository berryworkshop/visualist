require 'test_helper'

class TimePeriodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_period = time_periods(:one)
  end

  test "should get index" do
    get time_periods_url, as: :json
    assert_response :success
  end

  test "should create time_period" do
    assert_difference('TimePeriod.count') do
      post time_periods_url, params: { time_period: { duration: @time_period.duration, end: @time_period.end, precision: @time_period.precision, start: @time_period.start } }, as: :json
    end

    assert_response 201
  end

  test "should show time_period" do
    get time_period_url(@time_period), as: :json
    assert_response :success
  end

  test "should update time_period" do
    patch time_period_url(@time_period), params: { time_period: { duration: @time_period.duration, end: @time_period.end, precision: @time_period.precision, start: @time_period.start } }, as: :json
    assert_response 200
  end

  test "should destroy time_period" do
    assert_difference('TimePeriod.count', -1) do
      delete time_period_url(@time_period), as: :json
    end

    assert_response 204
  end
end

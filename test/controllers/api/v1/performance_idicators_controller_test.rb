require "test_helper"

class Api::V1::PerformanceIdicatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_performance_idicator = api_v1_performance_idicators(:one)
  end

  test "should get index" do
    get api_v1_performance_idicators_url, as: :json
    assert_response :success
  end

  test "should create api_v1_performance_idicator" do
    assert_difference("Api::V1::PerformanceIdicator.count") do
      post api_v1_performance_idicators_url, params: { api_v1_performance_idicator: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_performance_idicator" do
    get api_v1_performance_idicator_url(@api_v1_performance_idicator), as: :json
    assert_response :success
  end

  test "should update api_v1_performance_idicator" do
    patch api_v1_performance_idicator_url(@api_v1_performance_idicator), params: { api_v1_performance_idicator: {  } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_performance_idicator" do
    assert_difference("Api::V1::PerformanceIdicator.count", -1) do
      delete api_v1_performance_idicator_url(@api_v1_performance_idicator), as: :json
    end

    assert_response :no_content
  end
end

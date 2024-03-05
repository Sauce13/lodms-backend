require "test_helper"

class Api::SControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1 = api_v1s(:one)
  end

  test "should get index" do
    get api_v1s_url, as: :json
    assert_response :success
  end

  test "should create api_v1" do
    assert_difference("Api::V1.count") do
      post api_v1s_url, params: { api_v1: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1" do
    get api_v1_url(@api_v1), as: :json
    assert_response :success
  end

  test "should update api_v1" do
    patch api_v1_url(@api_v1), params: { api_v1: {  } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1" do
    assert_difference("Api::V1.count", -1) do
      delete api_v1_url(@api_v1), as: :json
    end

    assert_response :no_content
  end
end

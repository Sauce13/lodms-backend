require "test_helper"

class Api::V1::DepartmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_department = api_v1_departments(:one)
  end

  test "should get index" do
    get api_v1_departments_url, as: :json
    assert_response :success
  end

  test "should create api_v1_department" do
    assert_difference("Api::V1::Department.count") do
      post api_v1_departments_url, params: { api_v1_department: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_department" do
    get api_v1_department_url(@api_v1_department), as: :json
    assert_response :success
  end

  test "should update api_v1_department" do
    patch api_v1_department_url(@api_v1_department), params: { api_v1_department: {  } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_department" do
    assert_difference("Api::V1::Department.count", -1) do
      delete api_v1_department_url(@api_v1_department), as: :json
    end

    assert_response :no_content
  end
end

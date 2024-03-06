require "test_helper"

class Api::V1::ProgramAdminsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_program_admin = api_v1_program_admins(:one)
  end

  test "should get index" do
    get api_v1_program_admins_url, as: :json
    assert_response :success
  end

  test "should create api_v1_program_admin" do
    assert_difference("Api::V1::ProgramAdmin.count") do
      post api_v1_program_admins_url, params: { api_v1_program_admin: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_program_admin" do
    get api_v1_program_admin_url(@api_v1_program_admin), as: :json
    assert_response :success
  end

  test "should update api_v1_program_admin" do
    patch api_v1_program_admin_url(@api_v1_program_admin), params: { api_v1_program_admin: {  } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_program_admin" do
    assert_difference("Api::V1::ProgramAdmin.count", -1) do
      delete api_v1_program_admin_url(@api_v1_program_admin), as: :json
    end

    assert_response :no_content
  end
end

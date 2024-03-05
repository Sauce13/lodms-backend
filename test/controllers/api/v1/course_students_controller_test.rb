require "test_helper"

class Api::V1::CourseStudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_course_student = api_v1_course_students(:one)
  end

  test "should get index" do
    get api_v1_course_students_url, as: :json
    assert_response :success
  end

  test "should create api_v1_course_student" do
    assert_difference("Api::V1::CourseStudent.count") do
      post api_v1_course_students_url, params: { api_v1_course_student: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_course_student" do
    get api_v1_course_student_url(@api_v1_course_student), as: :json
    assert_response :success
  end

  test "should update api_v1_course_student" do
    patch api_v1_course_student_url(@api_v1_course_student), params: { api_v1_course_student: {  } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_course_student" do
    assert_difference("Api::V1::CourseStudent.count", -1) do
      delete api_v1_course_student_url(@api_v1_course_student), as: :json
    end

    assert_response :no_content
  end
end

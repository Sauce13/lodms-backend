require "test_helper"

class Api::V1::DepartmentLevelLearningOutcomesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_department_level_learning_outcome = api_v1_department_level_learning_outcomes(:one)
  end

  test "should get index" do
    get api_v1_department_level_learning_outcomes_url, as: :json
    assert_response :success
  end

  test "should create api_v1_department_level_learning_outcome" do
    assert_difference("Api::V1::DepartmentLevelLearningOutcome.count") do
      post api_v1_department_level_learning_outcomes_url, params: { api_v1_department_level_learning_outcome: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_department_level_learning_outcome" do
    get api_v1_department_level_learning_outcome_url(@api_v1_department_level_learning_outcome), as: :json
    assert_response :success
  end

  test "should update api_v1_department_level_learning_outcome" do
    patch api_v1_department_level_learning_outcome_url(@api_v1_department_level_learning_outcome), params: { api_v1_department_level_learning_outcome: {  } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_department_level_learning_outcome" do
    assert_difference("Api::V1::DepartmentLevelLearningOutcome.count", -1) do
      delete api_v1_department_level_learning_outcome_url(@api_v1_department_level_learning_outcome), as: :json
    end

    assert_response :no_content
  end
end

class Api::V1::DepartmentLevelLearningOutcomesController < ApplicationController
  before_action :set_api_v1_department_level_learning_outcome, only: %i[ show update destroy ]

  # GET /api/v1/department_level_learning_outcomes
  def index
    @api_v1_department_level_learning_outcomes = Api::V1::DepartmentLevelLearningOutcome.all

    render json: @api_v1_department_level_learning_outcomes
  end

  # GET /api/v1/department_level_learning_outcomes/1
  def show
    render json: @api_v1_department_level_learning_outcome
  end

  # POST /api/v1/department_level_learning_outcomes
  def create
    @api_v1_department_level_learning_outcome = Api::V1::DepartmentLevelLearningOutcome.new(api_v1_department_level_learning_outcome_params)

    if @api_v1_department_level_learning_outcome.save
      render json: @api_v1_department_level_learning_outcome, status: :created, location: @api_v1_department_level_learning_outcome
    else
      render json: @api_v1_department_level_learning_outcome.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/department_level_learning_outcomes/1
  def update
    if @api_v1_department_level_learning_outcome.update(api_v1_department_level_learning_outcome_params)
      render json: @api_v1_department_level_learning_outcome
    else
      render json: @api_v1_department_level_learning_outcome.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/department_level_learning_outcomes/1
  def destroy
    @api_v1_department_level_learning_outcome.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_department_level_learning_outcome
      @api_v1_department_level_learning_outcome = Api::V1::DepartmentLevelLearningOutcome.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_department_level_learning_outcome_params
      params.fetch(:api_v1_department_level_learning_outcome, {})
    end
end

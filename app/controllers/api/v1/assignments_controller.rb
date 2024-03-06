class Api::V1::AssignmentsController < ApplicationController
  before_action :set_api_v1_assignment, only: %i[ show update destroy ]

  # GET /api/v1/assignments
  def index
    @api_v1_assignments = Api::V1::Assignment.all

    render json: @api_v1_assignments
  end

  # GET /api/v1/assignments/1
  def show
    render json: @api_v1_assignment
  end

  # POST /api/v1/assignments
  def create
    @api_v1_assignment = Api::V1::Assignment.new(api_v1_assignment_params)

    if @api_v1_assignment.save
      render json: @api_v1_assignment, status: :created, location: @api_v1_assignment
    else
      render json: @api_v1_assignment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/assignments/1
  def update
    if @api_v1_assignment.update(api_v1_assignment_params)
      render json: @api_v1_assignment
    else
      render json: @api_v1_assignment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/assignments/1
  def destroy
    @api_v1_assignment.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_assignment
      @api_v1_assignment = Api::V1::Assignment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_assignment_params
      params.fetch(:api_v1_assignment, {})
    end
end

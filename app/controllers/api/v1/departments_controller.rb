class Api::V1::DepartmentsController < ApplicationController
  before_action :set_api_v1_department, only: %i[ show update destroy ]

  # GET /api/v1/departments
  def index
    @api_v1_departments = Api::V1::Department.all

    render json: @api_v1_departments
  end

  # GET /api/v1/departments/1
  def show
    render json: @api_v1_department
  end

  # POST /api/v1/departments
  def create
    @api_v1_department = Api::V1::Department.new(api_v1_department_params)

    if @api_v1_department.save
      render json: @api_v1_department, status: :created, location: @api_v1_department
    else
      render json: @api_v1_department.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/departments/1
  def update
    if @api_v1_department.update(api_v1_department_params)
      render json: @api_v1_department
    else
      render json: @api_v1_department.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/departments/1
  def destroy
    @api_v1_department.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_department
      @api_v1_department = Api::V1::Department.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_department_params
      params.fetch(:api_v1_department, {})
    end
end

class Api::V1::ProgramAdminsController < ApplicationController
  before_action :set_api_v1_program_admin, only: %i[ show update destroy ]

  # GET /api/v1/program_admins
  def index
    @api_v1_program_admins = Api::V1::ProgramAdmin.all

    render json: @api_v1_program_admins
  end

  # GET /api/v1/program_admins/1
  def show
    render json: @api_v1_program_admin
  end

  # POST /api/v1/program_admins
  def create
    @api_v1_program_admin = Api::V1::ProgramAdmin.new(api_v1_program_admin_params)

    if @api_v1_program_admin.save
      render json: @api_v1_program_admin, status: :created, location: @api_v1_program_admin
    else
      render json: @api_v1_program_admin.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/program_admins/1
  def update
    if @api_v1_program_admin.update(api_v1_program_admin_params)
      render json: @api_v1_program_admin
    else
      render json: @api_v1_program_admin.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/program_admins/1
  def destroy
    @api_v1_program_admin.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_program_admin
      @api_v1_program_admin = Api::V1::ProgramAdmin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_program_admin_params
      params.fetch(:api_v1_program_admin, {})
    end
end

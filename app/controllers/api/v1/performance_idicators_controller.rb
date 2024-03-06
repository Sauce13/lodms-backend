class Api::V1::PerformanceIdicatorsController < ApplicationController
  before_action :set_api_v1_performance_idicator, only: %i[ show update destroy ]

  # GET /api/v1/performance_idicators
  def index
    @api_v1_performance_idicators = Api::V1::PerformanceIdicator.all

    render json: @api_v1_performance_idicators
  end

  # GET /api/v1/performance_idicators/1
  def show
    render json: @api_v1_performance_idicator
  end

  # POST /api/v1/performance_idicators
  def create
    @api_v1_performance_idicator = Api::V1::PerformanceIdicator.new(api_v1_performance_idicator_params)

    if @api_v1_performance_idicator.save
      render json: @api_v1_performance_idicator, status: :created, location: @api_v1_performance_idicator
    else
      render json: @api_v1_performance_idicator.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/performance_idicators/1
  def update
    if @api_v1_performance_idicator.update(api_v1_performance_idicator_params)
      render json: @api_v1_performance_idicator
    else
      render json: @api_v1_performance_idicator.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/performance_idicators/1
  def destroy
    @api_v1_performance_idicator.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_performance_idicator
      @api_v1_performance_idicator = Api::V1::PerformanceIdicator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_performance_idicator_params
      params.fetch(:api_v1_performance_idicator, {})
    end
end

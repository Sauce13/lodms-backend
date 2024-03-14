class Api::V1::PerformanceIndicatorsController < ApplicationController
  before_action :set_api_v1_performance_indicator, only: %i[ show update destroy ]

  # GET /api/v1/performance_indicators
  def index
    @api_v1_performance_indicators = PerformanceIndicator.all

    render json: @api_v1_performance_indicators
  end

  # GET /api/v1/performance_indicators/1
  def show
    render json: @api_v1_performance_indicator
  end

  # POST /api/v1/performance_indicators
  def create
    @api_v1_performance_indicator = PerformanceIndicator.new(api_v1_performance_indicator_params)

    if @api_v1_performance_indicator.save
      render json: @api_v1_performance_indicator, status: :created, location: api_v1_performance_indicator_url(@api_v1_performance_indicator)
    else
      render json: @api_v1_performance_indicator.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/performance_indicators/1
  def update
    if @api_v1_performance_indicator.update(api_v1_performance_indicator_params)
      render json: @api_v1_performance_indicator
    else
      render json: @api_v1_performance_indicator.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/performance_indicators/1
  def destroy
    @api_v1_performance_indicator.destroy!
  end

  private
    def set_api_v1_performance_indicator
      @api_v1_performance_indicator = PerformanceIndicator.find(params[:id])
    end
    def api_v1_performance_indicator_params
      params.require(:api_v1_performance_indicator).permit(:indicator_Description)
    end
end

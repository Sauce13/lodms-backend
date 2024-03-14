class Api::V1::CoursePerformanceIndicatorController < ApplicationController
    before_action :set_course_performance_indicator, only: %i[ show update destroy ]
  
    # GET /api/v1/course_performance_indicator
    def index
      @course_performance_indicators = CoursePerformanceIndicator.all
  
      render json: @course_performance_indicators
    end
  
    # GET /api/v1/course_performance_indicator/1
    def show
      render json: @course_performance_indicator
    end
  
    # POST /api/v1/course_performance_indicator
    def create
      @course_performance_indicator = CoursePerformanceIndicator.new(course_performance_indicator_params)
  
      if @course_performance_indicator.save
        render json: @course_performance_indicator, status: :created
      else
        render json: @course_performance_indicator.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/v1/course_performance_indicator/1
    def update
      if @course_performance_indicator.update(course_performance_indicator_params)
        render json: @course_performance_indicator
      else
        render json: @course_performance_indicator.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/v1/course_performance_indicator/1
    def destroy
      @course_performance_indicator.destroy!
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_course_performance_indicator
        @course_performance_indicator = CoursePerformanceIndicator.find(params[:id])
      end
      def course_performance_indicator_params
        params.require(:api_v1_course_performance_indicator).permit(:course_id, :performance_indicator_id)
      end
  end
  
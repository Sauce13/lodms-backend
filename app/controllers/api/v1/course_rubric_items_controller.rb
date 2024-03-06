class Api::V1::CourseRubricItemsController < ApplicationController
  before_action :set_api_v1_course_rubric_item, only: %i[ show update destroy ]

  # GET /api/v1/course_rubric_items
  def index
    @api_v1_course_rubric_items = Api::V1::CourseRubricItem.all

    render json: @api_v1_course_rubric_items
  end

  # GET /api/v1/course_rubric_items/1
  def show
    render json: @api_v1_course_rubric_item
  end

  # POST /api/v1/course_rubric_items
  def create
    @api_v1_course_rubric_item = Api::V1::CourseRubricItem.new(api_v1_course_rubric_item_params)

    if @api_v1_course_rubric_item.save
      render json: @api_v1_course_rubric_item, status: :created, location: @api_v1_course_rubric_item
    else
      render json: @api_v1_course_rubric_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/course_rubric_items/1
  def update
    if @api_v1_course_rubric_item.update(api_v1_course_rubric_item_params)
      render json: @api_v1_course_rubric_item
    else
      render json: @api_v1_course_rubric_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/course_rubric_items/1
  def destroy
    @api_v1_course_rubric_item.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_course_rubric_item
      @api_v1_course_rubric_item = Api::V1::CourseRubricItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_course_rubric_item_params
      params.fetch(:api_v1_course_rubric_item, {})
    end
end

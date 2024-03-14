class Api::V1::CoursesController < ApplicationController
  before_action :set_course, only: %i[ show update destroy ]

  # GET /courses
  def index
    @courses = Course.all

    render json: @courses
  end

  # GET /courses/1
  def show
    course = Course.find(params[:id])
    course_as_json = course.as_json(include: {
      students: {},
      performance_indicators: {}
    })
  
    render json: course_as_json
  end
  
  

  # POST /courses
  def create
    @course = Course.new(course_params)

    if @course.save
      render json: @course, status: :created, location: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      render json: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # DELETE /courses/1
  def destroy
    @course.destroy!
  end

  # GET /courses/:id/instructors
  def instructors
    course = Course.find(params[:id])
    # Assuming you have a method in Course model to fetch instructor names
    instructor_names = course.instructors.pluck(:name)
    render json: instructor_names
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:name, :crn, :subject-area, :instructor, :college)
    end
end

class Api::V1::InstructorsController < ApplicationController
  before_action :set_instructor, only: [:show, :update, :destroy]

  # GET /instructors
  def index
    @instructors = Instructor.all
    render json: @instructors
  end

  # GET /instructors/1
  def show
    render json: @instructor
  end

  # POST /instructors
  def create
    @instructor = Instructor.new(instructor_params)
    if @instructor.save
      render json: @instructor, status: :created, location: @instructor
    else
      render json: @instructor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /instructors/1
  def update
    if @instructor.update(instructor_params)
      render json: @instructor
    else
      render json: @instructor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /instructors/1
  def destroy
    @instructor.destroy
    head :no_content
  end

  private

  def set_instructor
    @instructor = Instructor.find(params[:id])
  end

  def instructor_params
    params.require(:instructor).permit(:teacher_name, :email)
  end
end

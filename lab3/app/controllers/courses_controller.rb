class CoursesController < ApplicationController
  def index
    @courses = Course.order(params[:sort])
  end

  def new
    @course = Course.new
  end

  def show
    @course = Course.find(params[:id])
  end

  def create
    @course = Course.new(course_params)
    # checks validity of the course by using validations, only then allows user to save
    if @course.save
      redirect_to @course
    else
      render 'new'
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update(course_params)
      redirect_to @course
    else
      render 'edit'
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_path
  end

  private def course_params
    params.require(:course).permit(:class_id, :section, :component, :days, :time, :location, :professor)
  end
end

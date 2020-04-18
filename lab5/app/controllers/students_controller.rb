class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
    authorized?
    #@student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def index
    authorized?
    @students = Student.all
  end

  def create
    @student = Student.new(student_params)
    @student.email = current_user.email
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
    authorized?
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to @student
    else
      render 'edit'
    end
  end


  private def student_params
    params.require(:student).permit(:firstname, :lastname, :dotnumber,
                                    :mondaystart, :mondayend, :tuesdaystart, :tuesdayend,
                                    :wednesdaystart, :wednesdayend,
                                    :thursdaystart, :thursdayend, :fridaystart,
                                    :fridayend,
                                    grades_attributes: Grade.attribute_names.map(&:to_sym).push(:_destroy))
  end


  private def authorized?
    unless current_user.admin? || @student.email == current_user.email
      redirect_back(fallback_location: root_path)
    end
  end

end
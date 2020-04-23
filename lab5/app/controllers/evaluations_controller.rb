class EvaluationsController < ApplicationController

  def show
    @evaluation = Evaluation.find(params[:id])
  end

  def index
    @evaluation = Evaluation.order(params[:sort])
  end

  def new
    @evaluation = Evaluation.new
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.email = current_user.email
    if @evaluation.save
      redirect_to @evaluation
    else
      render 'new'
    end
  end

  def edit
    @evaluation = Evaluation.find(params[:id])

  end


  private def evaluation_params
    params.require(:evaluation).permit(:firstname, :lastname, :dotnumber, :class_id, :rating, :review)
  end

end

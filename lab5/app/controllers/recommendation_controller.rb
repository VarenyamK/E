class RecommendationController < ApplicationController

  def show
    @recommendation = Recommendation.find(params[:id])
  end

  def index
    @recommendation = Recommendation.all
  end

  def create
    @recommendation = Recommendation.new(recommendation_params)
    @recommendation.email = current_user.email
    if @recommendation.save
      redirect_to :action => :index
    else
      render 'new'
    end
  end

  def new
    @recommendation = Recommendation.new
  end

  def edit
    @recommendation = Recommendation.find(params[:id])

  end


  private def recommendation_params
    params.require(:user).permit(:firstname, :lastname, :dotnumber, :class_id, :section, :days, :start, :end)
  end

end

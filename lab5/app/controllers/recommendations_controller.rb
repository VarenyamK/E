class RecommendationsController < ApplicationController

  def show
    @recommendation = Recommendation.find(params[:id])
  end

  def index
    @recommendations = Recommendation.order(params[:sort])
  end

  def new
    @recommendation = Recommendation.new
  end

  def create
    @recommendation = Recommendation.new(recommendation_params)
    @recommendation.email = current_user.email
    if @recommendation.save
      redirect_to @recommendation
    else
      render 'new'
    end
  end

  def edit
    @recommendation = Recommendation.find(params[:id])

  end

  def update
    @recommendation = Recommendation.find(params[:id])
    if @recommendation.update(recommendation_params)
      redirect_to @recommendation
    else
      render 'edit'
    end
  end


  private def recommendation_params
    params.require(:recommendation).permit(:firstname, :lastname, :dotnumber, :class_id)
  end

end

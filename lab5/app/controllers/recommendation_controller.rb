class RecommendationController < ApplicationController
  def index
    @user = current_user
  end
end

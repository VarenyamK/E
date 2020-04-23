class TeacherhomeController < ApplicationController
  before_action :authorized?
  private def authorized?
    unless current_user.teacher? || current_user.admin?
      redirect_back(fallback_location: root_path)
    end
  end



  def index

    @user = current_user
  end
end

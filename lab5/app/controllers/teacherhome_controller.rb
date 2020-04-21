class TeacherhomeController < ApplicationController
  private def authorized?
    unless current_user.teacher?
      redirect_back(fallback_location: root_path)
    end
  end



  def index

    @user = current_user
  end
end

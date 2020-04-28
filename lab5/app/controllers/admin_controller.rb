class AdminController < ApplicationController
    before_action :authorized?

    private def authorized?
      unless current_user.admin?
        redirect_back(fallback_location: root_path)
      end
    end
  end


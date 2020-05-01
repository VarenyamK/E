class AdminController < ApplicationController
  #make sure the user is authorized and has admin privileges before allowing any action
    before_action :authorized?
    private def authorized?
      unless current_user.admin?
        redirect_back(fallback_location: root_path)

      end
    end

    def index
    end

  end


class RequestsController < ApplicationController
  private def authorized?
    unless current_user.teacher? || current_user.admin?
      redirect_back(fallback_location: root_path)
    end
  end

  private def isAdmin?
    unless current_user.admin?
      redirect_back(fallback_location: root_path)
    end
  end
  
  def show
    authorized?
    @request = Request.find(params[:id])
  end

  def index
    isAdmin?
    @requests = Request.order(params[:sort])
  end

  def new
    authorized?
    @request = Request.new
  end

  def create
    authorized?
    @request = Request.new(request_params)
    @request.email = current_user.email
    if @request.save
      redirect_to @request
    else
      render 'new'
    end
  end

  def edit
    isAdmin?
    @request = Request.find(params[:id])

  end


  private def request_params
    params.require(:request).permit(:firstname, :lastname, :dotnumber, :class_id, :section)
  end

end


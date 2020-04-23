class RequestsController < ApplicationController

  def show
    @request = Request.find(params[:id])
  end

  def index
    @requests = Request.where(email: current_user.email)
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.email = current_user.email
    if @request.save
      redirect_to @request
    else
      render 'new'
    end
  end

  def edit
    @request = Request.find(params[:id])

  end


  private def request_params
    params.require(:request).permit(:firstname, :lastname, :dotnumber, :class_id, :section)
  end

end


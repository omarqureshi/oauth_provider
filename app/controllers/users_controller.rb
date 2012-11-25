class UsersController < ApplicationController
  respond_to :json

  def index
    users = User
    users = users.where(:email => params[:email]) if params[:email].present?
    respond_with users.all
  end

  def authenticate
    user = User.find(params[:id])
    user = user.authenticate(params[:password])
    if user
      respond_with user
    else
      render :text => "404 Not found", :status => 404
    end
  end

  def show
    respond_with User.find(params[:id])
  end

  def create
    respond_with User.create(params[:user])
  end
  
end

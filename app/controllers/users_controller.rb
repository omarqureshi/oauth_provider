class UsersController < ApplicationController
  respond_to :json

  def index
    users = User
    users = users.where(:email => params[:email]) if params[:email].present?
    respond_with users.all
  end

  def show
    respond_with User.find(params[:id])
  end

  def create
    respond_with User.create(params[:user])
  end
  
end

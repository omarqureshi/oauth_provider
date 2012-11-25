class AccessGrantsController < ApplicationController
  respond_to :json

  def index
    respond_with AccessGrant.all
  end

  def create
    respond_with AccessGrant.create(params[:access_grant])
  end
  
end

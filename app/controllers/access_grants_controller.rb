class AccessGrantsController < ApplicationController
  respond_to :json

  def index
    grants = AccessGrant
    grants = grants.where(:token => params[:token]) if params[:token]
    respond_with grants.all
  end

  def create
    respond_with AccessGrant.create(params[:access_grant])
  end
  
end

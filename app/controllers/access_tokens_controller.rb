class AccessTokensController < ApplicationController
  respond_to :json

  def index
    respond_with AccessToken.all
  end

  def show
    respond_with AccessToken.find(params[:id])
  end

  def create
    application = Application.find_by_uid!(params[:application][:uid])
    respond_with AccessToken.create(params[:access_token].merge(:application_id => application.id))
  end

  def last_authorized
    token = AccessToken.last_authorized_token_for(params[:application_id], params[:resource_owner_id])
    if token
      render :json => token
    else
      render :text => "404 Not Found", :status => 404
    end
  end
  
end

class AccessTokensController < ApplicationController
  respond_to :json

  def index
    respond_with AccessToken.all
  end

  def last
  end
  
end

class ApplicationsController < ApplicationController
  respond_to :json
  
  def index
    applications = Application
    applications = applications.where(:uid => params[:uid]) if params[:uid].present?
    applications = applications.where(:secret => params[:secret]) if params[:secret].present?
    respond_with applications.all
  end

  def create
    respond_with Application.create(params[:application])
  end

  def show
    respond_with Application.find(params[:id])
  end

  def update
    application = Application.find(params[:id])
    application.name         = params[:application][:name]
    application.redirect_uri = params[:application][:redirect_uri]
    respond_with application.save
  end

  def destroy
    application = Application.find(params[:id])
    respond_with application.destroy
  end
  
end

class RegisteredApplicationsController < ApplicationController
  before_filter :authenticate_user!
  before_action :load_registered_application, except: [:index, :new, :create]

  def index
    @registered_applications = policy_scope(RegisteredApplication.all)
  end

  def show
  end

  def new
    @registered_application = RegisteredApplication.new
    authorize @registered_application
  end

  def create
    @registered_application = RegisteredApplication.new(registered_application_params)
    @registered_application.user = current_user
    authorize @registered_application

    if @registered_application.save
      flash[:notice] = "New application successfully registered."
      render :show
    else
      flash[:error] = "There was an error registering your new application. Please try again"
      render :new
    end
  end

  def edit
  end

  def update
    @registered_application.update_attributes(registered_application_params)

    if @registered_application.save
      flash[:notice] = "Application successfully updated"
      render :show
    else
      flash[:error] = "There was an error updating application."
      render :show
    end
  end

  def destroy
    if @registered_application.destroy
      flash[:notice] = "Application successfully removed"
      render :index
    else
      flash[:error] = "There was an error deleting application."
      render :show
    end
  end

  private
  def load_registered_application
    @registered_application = RegisteredApplication.find(params[:id])
    authorize @registered_application
  end

  def registered_application_params
    params.require(:registered_application).permit(:name, :url)
  end
end

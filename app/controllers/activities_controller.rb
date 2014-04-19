class ActivitiesController < ApplicationController
  before_action :authenticate_vendor!, only: [:new, :create, :edit, :destroy]

  def new
      @activity = current_vendor.activities.new
  end

  def edit
  end

  def destroy
  end

  def create
    @activity = current_vendor.activities.build(activities_params)
    if @activity.save
      flash[:success] = "Activity successfully added!"
      redirect_to vendor_profile_path
    else
      render 'new'
    end
  end


  private

  def activities_params
    params.require(:activity).permit(:name, :location, :description, :price)
  end

end

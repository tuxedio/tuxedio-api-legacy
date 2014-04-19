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
      redirect_to vendor_profile_path
    else
      flash[:alert] = "Something went wrong"
      redirect_to new_vendors_activities_path
    end
  end


  private

  def activities_params
    params.require(:activity).permit(:name, :location, :description, :price)
  end

end

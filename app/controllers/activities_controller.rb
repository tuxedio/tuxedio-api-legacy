class ActivitiesController < ApplicationController

  def new
    @activity = current_vendor.activities.new
  end

  def create
    @activity = current_vendor.activities.build(activities_params)
    if @activity.save
      redirect_to vendor_profile_path
    else
      flash[:error] = "Something went wrong"
      redirect_to new_vendors_activities_path
    end
  end


  private

  def activities_params
    params.require(:activity).permit(:name, :location, :description, :price)
  end

end

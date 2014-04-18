class ActivitiesController < ApplicationController



  def create
    @activity = current_vendor.activities.build(activities_params)
    if @activity.save
      redirect_to vendor_profile_path
    else
      redirect_to new_activities_path
    end
  end


  private

  def activities_params
    params.require(:activity).permit(:name, :location, :description, :price)
  end

end

class ActivitiesController < ApplicationController

  def new
    @activity = current_vendor.activities.new
  end

  def create
    @activity = current_vendor.activities.build(params)
    if(@activity.save)
      redirect_to vendor_profile
    else
    end
  end


  private

  def activities_params
    params.require(:name, :location, :description, :price)
  end

end

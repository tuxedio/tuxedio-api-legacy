class ActivitiesController < ApplicationController
  before_action :authenticate_vendor!, only: [:new, :create, :edit, :destroy]

  def show
    if params[:activity]
      @activity = Activity.find(params[:activity])
    else
      redirect_to explore_path
    end
  end

  def new
    @activity = current_vendor.activities.new
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])

    if @activity.update_attributes(activities_params)
      flash[:success] = "Activity updated"
      redirect_to vendor_profile_path
    else
      render 'edit'
    end
  end

  def create
    @activity = current_vendor.activities.build(activities_params)

    if @activity.save
      redirect_to new_activities_activity_times_path(activity: @activity)
    else
      render 'new'
    end
  end

  def explore
    @activities = Activity.take(9).shuffle!

    if person_signed_in?
      @adventure = current_person.current_adventure(session[:current_adventure_id])
      @itinerary = @adventure.itinerary_items unless @adventure.nil?
    end
  end

  private

  def activities_params
    params.require(:activity).permit(
      :name,
      :location,
      :picture,
      :description,
      :price,
      :start_time,
      :end_time
    )
  end

end

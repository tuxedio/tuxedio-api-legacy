class ActivitiesController < ApplicationController
  before_action :authenticate_vendor!, only: [:new, :create, :edit, :destroy]
  def show
    if params[:activity_id]
      @activity = Activity.find(params[:activity_id])
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
      flash["success"] = "Activity Updated"
      redirect_to vendor_profile_path
    else
      render 'edit'
    end
  end

  def destroy
  end

  def create
    params_hash = params[:activity]

    @activity = current_vendor.activities.build(activities_params)

    if @activity.save
      redirect_to new_activities_activity_times_path(:activity_id => @activity.id)
    else
      render 'new'
    end
  end

  def explore
    @activities = Activity.all.shuffle

    if customer_signed_in?
      @trip = current_customer.current_trip(session[:current_trip_id])
      @itinerary = @trip.itinerary_items unless @trip.nil?
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

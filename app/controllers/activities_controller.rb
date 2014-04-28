class ActivitiesController < ApplicationController
  before_action :authenticate_vendor!, only: [:new, :create, :edit, :destroy]
  def show
    @activity = Activity.find(params[:id])
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
      flash[:success] = "Activity Updated"
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
    @act_arr    ||= Activity.all
    @act_count  ||= Activity.count

    if customer_signed_in?
      @trip_count ||= current_customer.trips.count
    else
      @trip_count = 0
    end

    # later refactor to implement session var for :current_trip
    if customer_signed_in? and @trip_count > 0
      @itinerary ||= current_customer.trips.find(1).itinerary_items
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

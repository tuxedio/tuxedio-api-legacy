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
    @act_arr   ||= []
    @act_count ||= Activity.count
    @display_count = @act_count

    # Pick random activities from database to display in view
    @act_count.times do
      @act_arr << Activity.find_by_id(Random.rand(@act_count) + 1)
    end
  end


  private

  def activities_params
    params.require(:activity).permit(
      :name, 
      :location, 
      :description, 
      :price,
      :start_time,
      :end_time
    )
  end

end

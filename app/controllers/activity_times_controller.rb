class ActivityTimesController < ApplicationController
  before_action :authenticate_vendor!, only: [:new, :create, :edit, :destroy]

  def new
    @activity = Activity.find(params[:activity_id])
    @activity_time = @activity.activity_times.new
  end

  def create
    @activity = Activity.find(params[:activity_id])
    @activity_time = @activity.activity_times.build(activity_time_params)

    if @activity_time.save
      flash[:success] = "Activity time successfully added!"
      redirect_to vendor_profile_path
    else
      render 'new'
    end
  end


  private

  def activity_time_params
    params.require(:activity_time).permit(
      :activity_id,
      :start_time,
      :end_time
    )
  end

end

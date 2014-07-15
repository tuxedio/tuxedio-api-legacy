class ExperienceTimesController < ApplicationController
  before_action :authenticate_vendor!, only: [:new, :create, :edit, :destroy]

  def new
    @experience = Experience.find(params[:experience])
    @experience_time = @experience.experience_times.new
  end

  def create
    @experience = Experience.find(params[:experience])
    @experience_time = @experience.experience_times.build(experience_time_params)

    if @experience_time.save
      flash[:success] = "Experience time successfully added!"
      redirect_to vendor_profile_path
    else
      render 'new'
    end
  end


  private

  def experience_time_params
    params.require(:experience_time).permit(
      :experience,
      :start_time,
      :end_time
    )
  end

end

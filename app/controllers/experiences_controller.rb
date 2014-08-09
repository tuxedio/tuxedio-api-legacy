class ExperiencesController < ApplicationController
  before_action :authenticate_vendor!, only: [:new, :create, :edit, :destroy]

  def show
    if params[:experience]
      @experience = Experience.find(params[:experience])
    else
      redirect_to explore_path
    end
  end

  def new
    @experience = current_vendor.experiences.new
  end

  def edit
    @experience = Experience.find(params[:id])
  end

  def update
    @experience = Experience.find(params[:id])

    if @experience.update_attributes(experiences_params)
      flash[:success] = "Experience updated"
      redirect_to vendor_profile_path
    else
      render 'edit'
    end
  end

  def create
    @experience = current_vendor.experiences.build(experiences_params)

    if @experience.save
      redirect_to new_experiences_experience_times_path(experience: @experience)
    else
      render 'new'
    end
  end

  def explore
    @experiences = Experience.take(9).shuffle!
    @dashboard = Dashboard.new(current_person, session) if person_signed_in?
  end

  private

  def experiences_params
    params.require(:experience).permit(
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

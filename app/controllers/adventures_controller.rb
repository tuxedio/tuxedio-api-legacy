class AdventuresController < ApplicationController
  before_action :authenticate_person!

  def show
    @adventures = current_person.adventures

    if (@adventures.load.empty?)
      flash[:notice] = "You currently have no adventures created. Please create a adventure to get started."
      redirect_to new_people_adventures_path
      return
    end

    @current_adventure = current_person.current_adventure(current_adventure_id)
    @journey_items = @current_adventure.journey_items.includes(:experience_time).order('experience_times.start_time')
    #Set make sure current adventure and session var are same
    @experiences = @current_adventure.experiences
  end

  def new
    @adventure = current_person.adventures.new
  end

  def create
    @adventure = current_person.adventures.build(adventure_params)
    if @adventure.save
      flash[:notice] = "New adventure created!"
      redirect_to people_adventures_path
    else
      render 'new'
    end
  end

  def edit
    @adventure = current_person.current_adventure(current_adventure_id)
  end

  def update
    @adventure = current_person.current_adventure(current_adventure_id)
    if @adventure.update(adventure_params)
      redirect_to people_adventures_path
    else
      render 'edit'
    end
  end

  private

    def adventure_params
      params.require(:adventure).permit(:name, :location, :start_date, :number_of_days)
    end

    def current_adventure_id
      session[:current_adventure_id] ||= params[:adventure_selection]
    end

end

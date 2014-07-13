class AdventuresController < ApplicationController
  before_action :authenticate_customer!

  def show
    @adventures = current_customer.adventures

    if (@adventures.load.empty?)
      flash[:notice] = "You currently have no adventures created. Please create a adventure to get started."
      redirect_to new_customers_adventures_path
      return
    end

    @current_adventure = current_customer.current_adventure(current_adventure_id)
    @itinerary_items = @current_adventure.itinerary_items.includes(:activity_time).order('activity_times.start_time')
    #Set make sure current adventure and session var are same
    @activities = @current_adventure.activities
  end

  def new
    @adventure = current_customer.adventures.new
  end

  def create
    @adventure = current_customer.adventures.build(adventure_params)
    if @adventure.save
      flash[:notice] = "New adventure created!"
      redirect_to customers_adventures_path
    else
      render 'new'
    end
  end

  def edit
    @adventure = current_customer.current_adventure(current_adventure_id)
  end

  def update
    @adventure = current_customer.current_adventure(current_adventure_id)
    if @adventure.update(adventure_params)
      redirect_to customers_adventures_path
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

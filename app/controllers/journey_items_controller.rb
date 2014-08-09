class JourneyItemsController < ApplicationController

  def new
    @experience = Experience.find(journey_items_params[:experience])
    @experience_times = @experience.experience_times
    @adventures = current_user.rolable.adventures
    @journey_item = JourneyItem.new
  end

  def create
    # find person's adventures
    @adventure = current_user.rolable.adventures.find(journey_items_params[:adventure])
    @experience = Experience.find(journey_items_params[:experience])
    @experience_time = @experience.experience_times.find(journey_items_params[:experience_time])

    @journey_item = @adventure.journey_items.build(
      adventure:          @adventure,
      experience:      @experience,
      experience_time: @experience_time
    )

    if @journey_item.save
      session[:current_adventure_id] = journey_items_params[:adventure]
      flash[:success] = "#{@experience.name} added to adventure!"
      redirect_to explore_path
    else
      # new relies on experience_id so we must send in journey_items_params
      render :action => "new", :experience => journey_items_params[:experience]
    end
  end

  # This method will be deprecated in our API, but for now it's neccesary for our view.
  # Why? Because destroy will be asynchronously called so no redirects are neccesary.
  # For now it makes Cucumber happy.
  def change
    @adventure = current_user.rolable.adventures.find(session[:current_adventure_id])

    (params[:delete] || []).each do |index|
      @adventure.journey_items.destroy(index)
    end

    flash[:notice] = "Journey successfully updated!"
    redirect_to explore_path
  end

  def destroy
    JourneyItem.destroy(journey_items_params[:format])
    flash[:success] = "Item deleted from your journey"
    redirect_to people_adventures_path
  end

  private

    def journey_items_params
      params.permit(
        :adventure,
        :experience,
        :experience_time,
        :time
      )
    end

end

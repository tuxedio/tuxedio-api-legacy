class ItineraryItemsController < ApplicationController

  def new

    @activity = Activity.find(params[:activity_id])
    @itinerary_item = ItineraryItem.new
    @trips = current_customer.trips
    debugger
    @activity_times = @activity.activity_times || 'None'


  end

  def create

    # find customer's trips
    @trip = current_customer.trips.find_by_id(itinerary_items_params['trip_id'])
    @activity = Activity.find(params[:activity_id])


    @params = itinerary_items_params.merge!(params)
    @itinerary_item = @trip.itinerary_items.build(@params)

    if @itinerary_item.save
      flash[:success] = "#{@activity.name} added to trip!"
      redirect_to explore_path
    else
      # new relies on activity_id so we must send in params
      render :action => "new", :activity_id => params[:activity_id]
    end

  end

  private

    def itinerary_items_params
      params.require(:itinerary_item).permit(
        :trip_id,
        :activity_id,
        :time_id
      )
    end

end

class ItineraryItemsController < ApplicationController

  def new
    @activity = Activity.find(params[:activity_id])
    @itinerary_item = ItineraryItem.new

    @trips = current_customer.trips
  end

  def create
    @trip = current_customer.trips.find_by_id(itinerary_items_params['trip_id'])
    @params = itinerary_items_params
    @params['activity_id'] = params[:activity_id]
    @itinerary_item = @trip.itinerary_items.build(@params)

    if @itinerary_item.save
      redirect_to explore_path
    else
      render 'new'
    end

  end

  private

    def itinerary_items_params
      params.require(:itinerary_item).permit(
        :trip_id,
        :activity_id,
        :start_time,
        :end_time
      )
    end
end

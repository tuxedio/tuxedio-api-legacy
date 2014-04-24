class ItineraryItemsController < ApplicationController

  def new
    @activity = Activity.find(params[:activity_id])
    @itinerary_item = ItineraryItem.new(activity_id: @activity.id)
    @trips = current_customer.trips
  end

  def create
    @activity = Activity.find(params[:activity_id])
    @trips = current_customer.trips
    @itinerary_item = ItineraryItem.new(itinerary_items_params)
    if @itinerary_item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def itinerary_items_params
    params.require(:itinerary_item).permit(
      :trip_id,
      :activity_id,
      :start_time,
      :end_time
    )
  end
end

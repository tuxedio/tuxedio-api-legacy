class ItineraryItemsController < ApplicationController

  def new
  end

  def create
    @itinerary_item = @current_trip.itinerary_items.create(
      trip_id:     @current_trip.id,
      activity_id: params[:activity_id],
      start_time:  params[:start_time],
      end_time:    params[:end_time]
    )
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

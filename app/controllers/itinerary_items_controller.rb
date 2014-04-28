class ItineraryItemsController < ApplicationController

  def new

    @activity = Activity.find(params[:activity_id])
    @itinerary_item = ItineraryItem.new
    @trips = current_customer.trips
    @activity_times = @activity.activity_times

  end

  def create

    # find customer's trips
    @trip = current_customer.trips.find(itinerary_items_params[:trip_id])
    @activity = Activity.find(params[:activity_id])

    @itinerary_item = @trip.itinerary_items.build(
      trip_id:          params[:trip_id],
      activity_id:      params[:activity_id],
      activity_time_id: params[:activity_time_id]
    )

    if @itinerary_item.save
      flash[:success] = "#{@activity.name} added to trip!"
      redirect_to explore_path
    else
      # new relies on activity_id so we must send in params
      render :action => "new", :activity_id => params[:activity_id]
    end

  end

  def destroy
  end

  def update_cart
  end

  private

    def itinerary_items_params
      params.permit(
        :trip_id,
        :activity_time_id,
        :time_id
      )
    end

end

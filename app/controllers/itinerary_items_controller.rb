class ItineraryItemsController < ApplicationController

  def new
    @activity = Activity.find(itinerary_items_params[:activity])
    @activity_times = @activity.activity_times
    @trips = current_customer.trips
    @itinerary_item = ItineraryItem.new
  end

  def create
    # find customer's trips
    @trip = current_customer.trips.find(itinerary_items_params[:trip])
    @activity = Activity.find(itinerary_items_params[:activity])
    @activity_time = @activity.activity_times.find(itinerary_items_params[:activity_time])

    @itinerary_item = @trip.itinerary_items.build(
      trip:          @trip,
      activity:      @activity,
      activity_time: @activity_time
    )

    if @itinerary_item.save
      session[:current_trip_id] = itinerary_items_params[:trip]
      flash[:success] = "#{@activity.name} added to trip!"
      redirect_to explore_path
    else
      # new relies on activity_id so we must send in itinerary_items_params
      render :action => "new", :activity => itinerary_items_params[:activity]
    end
  end

  # This method will be deprecated in our API, but for now it's neccesary for our view.
  # Why? Because destroy will be asynchronously called so no redirects are neccesary.
  # For now it makes Cucumber happy.
  def change
    @trip = current_customer.trips.find(session[:current_trip_id])

    (params[:delete] || []).each do |index|
      @trip.itinerary_items.destroy(index)
    end

    flash[:notice] = "Itinerary successfully updated!"
    redirect_to explore_path
  end

  def destroy
    ItineraryItem.destroy(itinerary_items_params[:format])
    flash[:success] = "Item deleted from your itinerary"
    redirect_to customers_trips_path
  end

  private

    def itinerary_items_params
      params.permit(
        :trip,
        :activity,
        :activity_time,
        :time
      )
    end

end

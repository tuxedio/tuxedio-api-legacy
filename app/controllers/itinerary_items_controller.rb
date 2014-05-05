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
      session[:current_trip_id] = params[:trip_id]
      flash[:success] = "#{@activity.name} added to trip!"
      redirect_to explore_path
    else
      # new relies on activity_id so we must send in params
      render :action => "new", :activity_id => params[:activity_id]
    end

  end

  def change
    unless params[:delete].nil?
      params[:delete].each do |i|
        # Security: make sure that trip belongs to customer
        if ItineraryItem.find(i).trip.customer == current_customer
          ItineraryItem.find(i).destroy
        end
      end
      flash[:notice] = "Items successfully removed from trip!"
    end

    redirect_to explore_path
  end

  def destroy
    debugger
    ItineraryItem.find(params[:format]).destroy
    flash[:success] = "Item deleted from your itinerary"
    redirect_to customers_trips_path
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

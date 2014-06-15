class TripsController < ApplicationController
  before_action :authenticate_customer!

  def show
    @trips = current_customer.trips

    if (@trips.load.empty?)
      flash[:notice] = "You currently have no trips created. Please create a trip to get started."
      redirect_to new_customers_trips_path
      return
    end

    @current_trip = current_customer.current_trip(current_trip_id)
    @itinerary_items = @current_trip.itinerary_items.includes(:activity_time).order('activity_times.start_time')
    #Set make sure current trip and session var are same
    @activities = @current_trip.activities
  end

  def new
    @trip = current_customer.trips.new
  end

  def create
    @trip = current_customer.trips.build(trip_params)
    if @trip.save
      flash[:notice] = "New trip created!"
      redirect_to customers_trips_path
    else
      render 'new'
    end
  end

  def edit
    @trip = current_customer.current_trip(current_trip_id)
  end

  def update
    @trip = current_customer.current_trip(current_trip_id)
    if @trip.update(trip_params)
      redirect_to customers_trips_path
    else
      render 'edit'
    end
  end

  private

    def trip_params
      params.require(:trip).permit(:name, :location, :start_date, :number_of_days)
    end

    def current_trip_id
      session[:current_trip_id] ||= params[:trip_selection]
    end

end

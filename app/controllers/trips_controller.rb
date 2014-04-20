class TripsController < ApplicationController
  before_action :authenticate_customer!

  def show
    @trips = current_customer.trips
    @selected_trip = params[:trip_selection]
    @selected_trip ||= session[:trip_selection]
    if @selected_trip && !@selected_trip.empty?
      session[:trip_selection] = @selected_trip
    else
      @selected_trip = session[:trip_selection]
    end
    if !@selected_trip
      @selected_trip = @trips.last.id
    end
    @current_trip = @trips.find_by_id(@selected_trip)
    @activities = @current_trip.activities
  end

  def new
    @trip = current_customer.trips.new
  end

  def create
    @trip = current_customer.trips.build(trips_params)
    if @trip.save
      redirect_to customers_trips_path
    else
      render 'new'
    end
  end

  private

  def trips_params
    params.require(:trip).permit(:trip_name)
  end

end
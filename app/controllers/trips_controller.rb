class TripsController < ApplicationController
  before_action :authenticate_customer!

  def show
    @trips = current_customer.trips

    if(@trips.load.empty?)
      flash[:notice] = "You currently have no trips created. Please create a trip to get started."
      redirect_to new_customers_trips_path
      return
    end

    #this should be moved to its own method. It sets the current trip off the session variable.
    @selected_trip = params[:trip_selection]
    @selected_trip ||= session[:trip_selection]

    if @selected_trip && !@selected_trip.empty?
      session[:trip_selection] = @selected_trip
    else
      @selected_trip = session[:trip_selection]
    end

    unless (@selected_trip = @trips.find_by_id(@selected_trip))
      @selected_trip = @trips.first.id
    end

    @current_trip = @trips.find_by_id(@selected_trip)
    @activities   = @current_trip.activities
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
      params.require(:trip).permit(:trip_name, :location, :start_date, :number_of_days)
    end

end

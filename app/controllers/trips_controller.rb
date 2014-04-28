class TripsController < ApplicationController
  before_action :authenticate_customer!

  def show
    @trips = current_customer.trips

    if(@trips.load.empty?)
      flash[:notice] = "You currently have no trips created. Please create a trip to get started."
      redirect_to new_customers_trips_path
      return
    end


    @current_trip = current_trip
    @itinerary_items = current_trip.itinerary_items.find(
                      :all,
                      :include => :activity_time,
                      :order => 'activity_times.start_time')
    #Set make sure current trip and session var are same
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

    def current_trip
      #grab params from the website

      if !params[:trip_selection].nil? && !params[:trip_selection].empty?
        @current_trip_id = params[:trip_selection]
      end

      @current_trip_id ||= session[:current_trip_id]
      session[:current_trip_id] = @current_trip_id

      if @current_trip_id.nil?
        @current_trip_id = @trips.last.id
      end

      @current_trip = @trips.find_by_id(@current_trip_id)

    end

end

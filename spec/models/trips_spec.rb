require 'spec_helper'

describe "Trips".upcase.colorize(:light_blue) do
  let(:customer) { FactoryGirl.create(:customer) }
  before do
    customer.confirm!
    @trip = customer.trips.create(trip_name: "Trip1", location: "Boulder", start_date: Date.today, number_of_days: 1)
  end


  subject{ @trip }

  it { should respond_to(:trip_name) }
  it { should respond_to(:location) }
  it { should respond_to(:start_date) }
  it { should respond_to(:number_of_days) }

  it { should be_valid }


  describe "Check parameters for blankness".upcase.colorize(:light_blue) do
    describe "when trip name is not present" do
      before { @trip.trip_name = " " }
      it { should_not be_valid }
    end
    describe "when location is not present" do
      before { @trip.location = " " }
      it { should_not be_valid }
    end
    describe "when number of days is not present" do
      before { @trip.number_of_days = " " }
      it { should_not be_valid }
    end
  end

  describe "Check trip is in the future".upcase.colorize(:light_blue) do
    describe "when start date is before the current date" do
      before { @trip.location = Date.yesterday }
      it { should_not be_valid }
    end
  end

end
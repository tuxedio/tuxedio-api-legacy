require 'spec_helper'

describe "Trips".upcase.colorize(:light_blue) do
  let(:customer) { FactoryGirl.create(:customer) }
  before { customer.confirm! }
  
  before {  @trip = customer.trips.create(
    trip_name: "Trip1", 
    location: "Boulder", 
    start_date: Date.today, 
    number_of_days: 1
    )
  }

  subject{ @trip }

  it { should respond_to(:trip_name) }
  it { should respond_to(:location) }
  it { should respond_to(:start_date) }
  it { should respond_to(:number_of_days) }
  it { should respond_to(:customer_id) }
  it { should be_valid }

  describe "Check parameters for blankness".upcase.colorize(:light_blue) do

    describe "when customer_id is not present" do
      before { @trip.customer_id = nil }
      it { should_not be_valid }
    end

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

    describe "Unacceptable input".upcase.colorize(:light_blue) do
      describe "when number of days is zero" do
        before { @trip.number_of_days = 0 }
        it { should_not be_valid }
      end

      describe "when location is not in valid location" do
        before { @trip.location = "Albania" }
        it { should_not be_valid }
      end
    end
    
    describe "Unacceptable input".upcase.colorize(:light_blue) do
      describe "when trip name is present" do
        before { @trip.trip_name = "Test " }
        it { should be_valid }
      end

      describe "when location is present and valid" do
        before { @trip.location = "Boulder" }
        it { should be_valid }
      end
      
      describe "when number of days is present" do
        before { @trip.number_of_days = 10 }
        it { should be_valid }
      end

      describe "when start date is before the current date" do
        before { @trip.location = Date.yesterday }
        it { should_not be_valid }
      end
    end
  end
end

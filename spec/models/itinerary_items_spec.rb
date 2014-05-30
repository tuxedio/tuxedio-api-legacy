require 'spec_helper'
require 'date'

describe "Itinerary Item".upcase.colorize(:light_blue) do

  before do
    @trip = FactoryGirl.create(:trip)
    @activity_time = FactoryGirl.create(:activity_time)
    # Needs to be refactored to one Factory Girl Call.
    @itinerary_item = @trip.itinerary_items.create(
      trip: @trip,
      activity_time: @activity_time
      )
  end


  subject { @itinerary_item }

  it { should respond_to(:activity) }
  it { should respond_to(:activity_time) }
  it { should respond_to(:trip) }
  it { should respond_to(:customer) }
  it { should respond_to(:vendor) }

  it { should be_valid }

#----------------------------------

  describe "when association is nil for " do

    describe "trip" do
      before { @itinerary_item.trip = nil }
      it { should_not be_valid }
    end

    describe "activity" do
      before { @itinerary_item.activity_time = nil }
      it { should_not be_valid }
    end
  end

  describe "Valid IDs" do

    describe "valid trip ID" do
      before { @itinerary_item.trip = @trip }
      it { should be_valid }
    end

    describe "valid activity ID" do
      before { @itinerary_item.activity = @trip }
      it { should be_valid }
    end
  end

end

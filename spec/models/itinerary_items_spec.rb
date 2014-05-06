require 'spec_helper'
require 'date'

describe "Itinerary Item".upcase.colorize(:light_blue) do

  before do
    @trip = FactoryGirl.create(:trip)
    @activity_time = FactoryGirl.create(:activity_time)
    # Needs to be refactored to one Factory Girl Call.
    @itinerary_item = @trip.itinerary_items.create(
      activity_id: 1,
      trip_id: @trip.id,
      activity_time_id: @activity_time.id
      )
  end


  subject { @itinerary_item }

  it { should respond_to(:activity_id) }
  it { should respond_to(:trip_id) }
  it { should respond_to(:trip) }

  it { should be_valid }

#----------------------------------

  describe "Invalid IDs" do

    describe "invalid trip ID" do
      before { @itinerary_item.trip_id = 123456 }
      it { should_not be_valid }
    end

    describe "invalid activity ID" do
      before { @itinerary_item.activity_id = 123456 }
      it { should_not be_valid }
    end
  end

  describe "Valid IDs" do

    describe "valid trip ID" do
      before { @itinerary_item.trip_id = 1 }
      it { should be_valid }
    end

    describe "valid activity ID" do
      before { @itinerary_item.activity_id = 1 }
      it { should be_valid }
    end
  end
end

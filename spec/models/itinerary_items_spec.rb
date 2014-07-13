require 'spec_helper'
require 'date'

describe "Itinerary Item".upcase.colorize(:light_blue) do

  before do
    @adventure = FactoryGirl.create(:adventure)
    @activity_time = FactoryGirl.create(:activity_time)
    # Needs to be refactored to one Factory Girl Call.
    @itinerary_item = @adventure.itinerary_items.create(
      adventure: @adventure,
      activity_time: @activity_time
      )
  end


  subject { @itinerary_item }

  it { should respond_to(:activity) }
  it { should respond_to(:activity_time) }
  it { should respond_to(:adventure) }
  it { should respond_to(:person) }
  it { should respond_to(:vendor) }

  it { should be_valid }

#----------------------------------

  describe "when association is nil for " do

    describe "adventure" do
      before { @itinerary_item.adventure = nil }
      it { should_not be_valid }
    end

    describe "activity" do
      before { @itinerary_item.activity_time = nil }
      it { should_not be_valid }
    end

  end

  describe "can access association for  " do

    describe "person" do
      it { expect(@itinerary_item.adventure.person.id).to equal(1) }
    end

    describe "vendor" do
      it { expect(@itinerary_item.activity_time.vendor.id).to equal(1) }
    end
  end

  describe "Valid IDs" do

    describe "valid adventure ID" do
      before { @itinerary_item.adventure = @adventure }
      it { should be_valid }
    end

    describe "valid activity ID" do
      before { @itinerary_item.activity = @adventure }
      it { should be_valid }
    end
  end

end

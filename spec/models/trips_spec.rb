require 'spec_helper'

describe Trip do

  subject(:trip) { FactoryGirl.build(:trip) }

  describe "instantiation of trip" do

    it "should be a trip" do
      expect(trip).to be_a(Trip)
      expect(trip).to be_valid
    end
  end

  describe "trip_name" do
    it "should respond to trip_name" do
      expect(trip).to respond_to(:trip_name)
    end

    describe "when trip_name is not present" do
      before { trip.trip_name = nil }
      it "should not be valid" do
        expect(trip).to_not be_valid
      end
    end
    describe "when trip name is too long" do
      before { trip.trip_name = 'a' * 21 }
      it "should not be valid" do
        expect(trip).to_not be_valid
      end
    end
  end

  describe "location" do
    it "should respond to location" do
      expect(trip).to respond_to(:location)
    end
    describe "when it is in an unacceptable location" do
      before { trip.location = "Some unacceptable location" }
      it "should not be valid" do
        expect(trip).to_not be_valid
      end
    end
  end

  describe "customer" do
    it "should respond to customer" do
      expect(trip).to respond_to(:customer)
    end
    describe "when customer is destroyed" do
      before { trip.customer.destroy }
      it "should also destroy associated trips" do
        expect(Trip.count).to equal(0)
      end
    end
  end

  describe "start_date" do
    it "should respond to start_date" do
      expect(trip).to respond_to(:start_date)
    end

    describe "when start_date is not present" do
      before { trip.start_date = nil }
      it "should not be valid" do
        expect(trip).to_not be_valid
      end
    end
    describe "when start_date is before current time" do
      before { trip.start_date = Time.now.yesterday }
      it "should not be valid" do
        expect(trip).to_not be_valid
      end
    end
  end

  describe "number_of_days" do
    it "should respond to number_of_days" do
      expect(trip).to respond_to(:number_of_days)
    end

    describe "when number_of_days is not present" do
      before { trip.number_of_days = nil }
      it "should not be valid" do
        expect(trip).to_not be_valid
      end
    end
    describe "when number_of_days is too short" do
      before { trip.number_of_days = -5 }
      it "should not be valid" do
        expect(trip).to_not be_valid
      end
    end
  end
end

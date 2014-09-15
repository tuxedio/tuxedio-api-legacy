require 'spec_helper'

describe Adventure do

  subject(:adventure) { FactoryGirl.build(:adventure) }

  describe "instantiation of adventure" do

    it "should be a adventure" do
      expect(adventure).to be_a(Adventure)
      expect(adventure).to be_valid
    end
  end

  describe "name" do
    it "should respond to name" do
      expect(adventure).to respond_to(:name)
    end

    describe "when name is not present" do
      before { adventure.name = nil }
      it "should not be valid" do
        expect(adventure).to_not be_valid
      end
    end
    describe "when adventure name is too long" do
      before { adventure.name = 'a' * 21 }
      it "should not be valid" do
        expect(adventure).to_not be_valid
      end
    end
  end

  describe "location" do
    it "should respond to location" do
      expect(adventure).to respond_to(:location)
    end
    describe "when it is in an unacceptable location" do
      before { adventure.location = "Some unacceptable location" }
      it "should not be valid" do
        expect(adventure).to_not be_valid
      end
    end
  end

  describe "person" do
    it "should respond to person" do
      expect(adventure).to respond_to(:person)
    end
    describe "when person is destroyed" do
      before { adventure.person.destroy! }
      it "should also destroy associated adventures" do
        expect(Adventure.count).to equal(0)
      end
    end
  end

  describe "start_date" do
    it "should respond to start_date" do
      expect(adventure).to respond_to(:start_date)
    end

    describe "when start_date is not present" do
      before { adventure.start_date = nil }
      it "should not be valid" do
        expect(adventure).to_not be_valid
      end
    end
    describe "when start_date is before current time" do
      before { adventure.start_date = Time.now.yesterday }
      it "should not be valid" do
        expect(adventure).to_not be_valid
      end
    end
  end

  describe "number_of_days" do
    it "should respond to number_of_days" do
      expect(adventure).to respond_to(:number_of_days)
    end

    describe "when number_of_days is not present" do
      before { adventure.number_of_days = nil }
      it "should not be valid" do
        expect(adventure).to_not be_valid
      end
    end
    describe "when number_of_days is too short" do
      before { adventure.number_of_days = -5 }
      it "should not be valid" do
        expect(adventure).to_not be_valid
      end
    end
  end
end

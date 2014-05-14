require 'spec_helper'

describe "Activity".upcase.colorize(:light_blue) do

  before { @activity = FactoryGirl.create(:activity) }

  subject { @activity }

  it { should respond_to(:name) }
  it { should respond_to(:location) }
  it { should respond_to(:description) }
  it { should respond_to(:price) }
  it { should respond_to(:vendor) }

  it { should be_valid }

#------------------------------------
  describe "\nCheck parameters for blankness".upcase.colorize(:light_blue) do
    describe "when name is not present" do
      before { @activity.name = " " }
      it { should_not be_valid }
    end

    describe "when location is not present" do
      before { @activity.location = " " }
      it { should_not be_valid }
    end

    describe "when price is not present" do
      before { @activity.price = nil }
      it { should_not be_valid }
    end
  end

  describe "\nactivity Validation".upcase.colorize(:light_blue) do

    describe "when name is too long" do
      before { @activity.name = "z" * 101 }
      it { should_not be_valid }
    end

    describe "when location is too long" do
      before { @activity.location = "z" * 31 }
      it { should_not be_valid }
    end

    describe "when price format is valid" do
      it "it should be valid" do
        prices = [10.00, 150.00, 600.00, 0]
        prices.each do |valid|
          @activity.price = valid
          expect(@activity).to be_valid
        end
      end
    end

    describe "when vendor does not exist" do
      before { @activity.vendor = nil }
      it { should_not be_valid }
    end
  end
#------------------------------------
# Description
  describe "\ndescription".upcase.colorize(:light_blue) do
    describe "when activity has a valid description" do
      before { @activity.description = "Ipsum schplitsum" }
      it { should be_valid }
    end

    describe "when activity does not have description" do
      before { @activity.description = "" }
      it { should_not be_valid }
    end

    describe "when activity description is too long" do
      before { @activity.description = "a" * 161 }
      it { should_not be_valid }
    end
  end
end

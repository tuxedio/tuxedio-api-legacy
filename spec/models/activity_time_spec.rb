require 'spec_helper'

describe "Activity time".upcase.colorize(:light_blue) do

  before { @activity_time = FactoryGirl.create(:activity_time)}

  subject { @activity_time }

  it { should respond_to(:start_time) }
  it { should respond_to(:end_time) }
  it { should respond_to(:activity) }

  it { should be_valid }


  describe "when vendor adds activity time" do

    describe "with valid start time" do
      before { @activity_time.start_time = Time.now.tomorrow }
      it { should be_valid }
    end

    describe "with invalid start time" do
      before { @activity_time.start_time = Time.now.yesterday }
      it { should_not be_valid }
    end

    describe "with valid end time" do
      before { @activity_time.end_time = Time.now.tomorrow.tomorrow }
      it { should be_valid }
    end

    describe "with invalid end time" do
      before { @activity_time.start_time = Time.now.yesterday }
      it { should_not be_valid }
    end
  end

  describe "association with actitivty" do

    describe "with invalid association" do
      before { @activity_time.activity = nil }
      it { should_not be_valid }
    end
  end
end

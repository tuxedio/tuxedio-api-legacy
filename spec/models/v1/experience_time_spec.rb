require 'spec_helper'

describe "Experience time".upcase do

  before { @experience_time = FactoryGirl.create(:experience_time)}

  subject { @experience_time }

  it { should respond_to(:start_time) }
  it { should respond_to(:end_time) }
  it { should respond_to(:experience) }

  it { should be_valid }


  describe "when vendor adds experience time" do

    describe "with valid start time" do
      before { @experience_time.start_time = Time.now.tomorrow }
      it { should be_valid }
    end

    describe "with invalid start time" do
      before { @experience_time.start_time = Time.now.yesterday }
      it { should_not be_valid }
    end

    describe "with valid end time" do
      before { @experience_time.end_time = Time.now.tomorrow.tomorrow }
      it { should be_valid }
    end

    describe "with invalid end time" do
      before { @experience_time.start_time = Time.now.yesterday }
      it { should_not be_valid }
    end
  end

  describe "association with actitivty" do

    describe "with invalid association" do
      before { @experience_time.experience = nil }
      it { should_not be_valid }
    end
  end
end

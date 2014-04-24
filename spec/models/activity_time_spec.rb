require 'spec_helper'

describe "Activity time".upcase.colorize(:light_blue) do

  before { @vendor = Vendor.create(
    name: "Boulder Skydiving",
    email: "Vendor1@example.com",
    location: "Boulder",
    zip_code: 80301,
    password: "mypassword1",
    password_confirmation: "mypassword1"
  )
  }

  before { @activity =  Activity.new(
    name: "Skydiving",
    price: 150.00,
    location: "Boulder",
    description: "Ipsum splitsum",
    vendor_id: 1
  )
  }

  before { @activity_time = ActivityTime.new(
    start_time: Time.now.tomorrow,
    end_time: Time.now.tomorrow.tomorrow,
    activity_id: 1
  )
  }

  subject { @activity_time }

  it { should respond_to(:start_time) }
  it { should respond_to(:end_time) }
  it { should respond_to(:activity_id) }

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
      before { @activity_time.start_time = Time.now.tomorrow.tomorrow }
      it { should be_valid }
    end

    describe "with invalid end time" do 
      before { @activity_time.start_time = Time.now.yesterday }
      it { should_not be_valid }
    end
  end

  describe "association with actitivty" do

    describe "with valid association" do
      before { @activity_time.activity_id = 1 }
      it { should be_valid }
    end

    describe "with invalid association" do
      before { @activity_time.activity_id = nil }
      it { should_not be_valid }
    end
  end
end

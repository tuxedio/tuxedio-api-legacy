require 'spec_helper'

describe "Customer".upcase.colorize(:light_blue) do

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

end

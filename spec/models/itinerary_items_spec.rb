require 'spec_helper'
require 'date'

describe "Itinerary Item".upcase.colorize(:light_blue) do

  before { @customer =  Customer.create(
    name: "John Smith",
    email: "JohnSmith@example.com",
    location: "Boulder",
    password: "mypassword",
    password_confirmation: "mypassword"
  )
  }

  before { @vendor = Vendor.create(
    name: "Larkburger",
    email: "Vendor1@example.com",
    location: "Boulder",
    password: "mypassword1",
    password_confirmation: "mypassword1",
    zip_code: 80302
  )
  }

  before { @activity =  @vendor.activities.create(
    name: "Skydiving",
    price: 150.00,
    location: "Boulder",
    description: "Ipsum splitsum",
    vendor_id: 1
  )
  }

  before { @trip = @customer.trips.create(
    trip_name: "My Trip",
    location: "Boulder",
    start_date: Time.now,
    number_of_days: 2
  )
  }

  before { @activity_time  = @activity.activity_times.create(
    start_time: Time.new(2002, 10, 31, 2, 2, 2, "+02:00"),
    end_time:   Time.new(2002, 10, 31, 2, 2, 2, "+03:00"),
    activity_id: 1
  )
  }

  before { @itinerary_item = @trip.itinerary_items.create(
    activity_id: 1,
    trip_id: 1,
    activity_time_id: 1
  )
  }


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

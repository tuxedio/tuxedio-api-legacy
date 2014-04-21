require 'spec_helper'

describe "Trips".upcase.colorize(:light_blue) do
  let(:vendor) { FactoryGirl.create(:vendor) }
  before do

    vendor.confirm!

  end
  let(:trip) { vendor.trips.create(name: "Trip1", location: "Boulder", start_date: Time.now, number_of_days: 1) }

  subject{ trip }

  it { should respond_to(:name) }
  it { should respond_to(:location) }
  it { should respond_to(:start_date) }
  it { should respond_to(:number_of_days) }

end
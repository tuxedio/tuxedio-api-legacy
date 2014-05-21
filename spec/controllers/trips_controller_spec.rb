require 'spec_helper'

describe "Trips controller".upcase.colorize(:light_blue) do

  before do
    @trip = FactoryGirl.create(:trip)
  end

  subject{ @trip }

  describe "current trip id".upcase.colorize(:light_blue) do

    describe "when current_trip_id is called" do

      describe "when session variable is nil" do
      # mock here for params
      # expect value to equal eachother
      end

      describe "when session variable is valid" do
      # mock here for params
      # expect value to equal eachother
      end

      describe "when session variable is invalid" do
      # mock here for params
      # expect value to equal eachother
      end
    end
  end
end

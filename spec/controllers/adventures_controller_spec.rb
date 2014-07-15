require 'spec_helper'

describe "Adventures controller".upcase.colorize(:light_blue) do

  before do
    @adventure = FactoryGirl.create(:adventure)
  end

  subject{ @adventure }

  describe "current adventure id".upcase.colorize(:light_blue) do

    describe "when current_adventure_id is called" do

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

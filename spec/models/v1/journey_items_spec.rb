require 'spec_helper'
require 'date'

describe "Journey Item".upcase.colorize(:light_blue) do

  before do
    @adventure = FactoryGirl.create(:adventure)
    @experience_time = FactoryGirl.create(:experience_time)
    # Needs to be refactored to one Factory Girl Call.
    @journey_item = @adventure.journey_items.create(
      adventure: @adventure,
      experience_time: @experience_time
      )
  end


  subject { @journey_item }

  it { should respond_to(:experience) }
  it { should respond_to(:experience_time) }
  it { should respond_to(:adventure) }
  it { should respond_to(:person) }
  it { should respond_to(:vendor) }

  it { should be_valid }

#----------------------------------

  describe "when association is nil for " do

    describe "adventure" do
      before { @journey_item.adventure = nil }
      it { should_not be_valid }
    end

    describe "experience" do
      before { @journey_item.experience_time = nil }
      it { should_not be_valid }
    end

  end

  describe "can access association for  " do
    describe "person" do
      it { expect(@journey_item.adventure.person).to be_a V1::Person }
    end

    describe "vendor" do
      it { expect(@journey_item.experience_time.vendor).to be_a V1::Vendor }
    end
  end

  describe "Valid IDs" do

    describe "valid adventure ID" do
      before { @journey_item.adventure = @adventure }
      it { should be_valid }
    end

    describe "valid experience ID" do
      before { @journey_item.experience = @adventure }
      it { should be_valid }
    end
  end

end

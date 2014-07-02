require 'spec_helper'

describe Activity do

  subject (:activity) { FactoryGirl.build(:activity) }

  describe "instantiation" do
    it do
      is_expected.to be_valid
      is_expected.to be_an(Activity)
    end
  end

  describe "name" do
    it "should respond to name" do
      expect(activity).to respond_to(:name)
    end
    describe "when name is not present" do
      before { activity.name = nil }
      it { is_expected.to_not be_valid }
    end
    describe "when activity name is too long" do
      before { activity.name = 'a' * 101 }
      it { is_expected.to_not be_valid }
    end
  end

  describe "location" do
    it "should respond to location" do
      expect(activity).to respond_to(:location)
    end
    describe "when it is in an unacceptable location" do
      before { activity.location = "Some unacceptable location" }
      it { is_expected.to_not be_valid }
    end
    describe "when location is too long" do
      before { activity.location = 'a' * 31 }
      it { is_expected.to_not be_valid }
    end
  end

  describe "price" do
    it "should respond to price" do
      expect(activity).to respond_to(:price)
    end
    describe "when it is in an invalid price" do
      before { activity.price = -4.0 }
      it { is_expected.to_not be_valid }
    end
    it "it should be valid with acceptable prices" do
      prices = [10.00, 150.00, 600.00, 0]
      prices.each do |valid|
        activity.price = valid
        expect(activity).to be_valid
      end
    end
  end

  describe "vendor" do
    it "should respond to vendor" do
      expect(activity).to respond_to(:vendor)
    end
    describe "when vendor does not exist" do
      before { activity.vendor = nil }
      it { is_expected.to_not be_valid }
    end
  end

  describe "description" do
    describe "when activity does not have description" do
      before { activity.description = "" }
      it { is_expected.to_not be_valid }
    end

    describe "when activity description is too long" do
      before { activity.description = "a" * 161 }
      it { is_expected.to_not be_valid }
    end
  end

  describe "picture" do
    describe "when image is invalid format" do
      it { expect { activity.update(picture: 'virus.exe') }.to raise_error }
    end
  end
end

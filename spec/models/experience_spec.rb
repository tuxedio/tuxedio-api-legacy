require 'spec_helper'

describe Experience do

  subject (:experience) { FactoryGirl.build(:experience) }

  describe "instantiation" do
    it do
      is_expected.to be_valid
      is_expected.to be_an(Experience)
    end
  end

  describe "name" do
    it "should respond to name" do
      expect(experience).to respond_to(:name)
    end
    describe "when name is not present" do
      before { experience.name = nil }
      it { is_expected.to_not be_valid }
    end
    describe "when experience name is too long" do
      before { experience.name = 'a' * 101 }
      it { is_expected.to_not be_valid }
    end
  end

  describe "location" do
    it "should respond to location" do
      expect(experience).to respond_to(:location)
    end
    describe "when it is in an unacceptable location" do
      before { experience.location = "Some unacceptable location" }
      it { is_expected.to_not be_valid }
    end
    describe "when location is too long" do
      before { experience.location = 'a' * 31 }
      it { is_expected.to_not be_valid }
    end
  end

  describe "price" do
    it "should respond to price" do
      expect(experience).to respond_to(:price)
    end
    describe "when it is in an invalid price" do
      before { experience.price = -4.0 }
      it { is_expected.to_not be_valid }
    end
    it "it should be valid with acceptable prices" do
      prices = [10.00, 150.00, 600.00, 0]
      prices.each do |valid|
        experience.price = valid
        expect(experience).to be_valid
      end
    end
  end

  describe "vendor" do
    it "should respond to vendor" do
      expect(experience).to respond_to(:vendor)
    end
    describe "when vendor does not exist" do
      before { experience.vendor = nil }
      it { is_expected.to_not be_valid }
    end
  end

  describe "description" do
    describe "when experience does not have description" do
      before { experience.description = "" }
      it { is_expected.to_not be_valid }
    end

    describe "when experience description is too long" do
      before { experience.description = "a" * 161 }
      it { is_expected.to_not be_valid }
    end
  end

  describe "picture" do
    describe "when image is invalid format" do
      it { expect { experience.update(picture: 'virus.exe') }.to raise_error }
    end
  end
end

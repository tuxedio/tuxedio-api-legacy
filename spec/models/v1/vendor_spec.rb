require 'spec_helper'

describe "Vendor Create" do

  before { @vendor = FactoryGirl.build(:vendor1) }
  subject { @vendor }

  it { should respond_to(:name) }
  it { should respond_to(:location) }
  it { should respond_to(:zip_code) }
  it { should respond_to(:address) }
  it { should respond_to(:coordinates) }
  it { should respond_to(:country) }
  it { should respond_to(:confirmed) }
  it { should respond_to(:state) }
  it { should respond_to(:sample_image) }

  it { should be_valid }

#------------------------------------
  describe "\nCheck parameters for blankness" do
    describe "when name is not present" do
      before { @vendor.name = " " }
      it { should_not be_valid }
    end


    describe "when location is not present" do
      before { @vendor.location = " " }
      it { should_not be_valid }
    end

    describe "when zip code is not present" do
      before { @vendor.zip_code = nil  }
      it { should_not be_valid }
    end

  end

  describe "\nVendor Validation" do

    describe "when name is too long" do
      before { @vendor.name = "z" * 51 }
      it { should_not be_valid }
    end

    describe "when zip_code is too long" do
      before { @vendor.location = 803011 }
      it { should_not be_valid }
    end

    describe "when location is too long" do
      before { @vendor.location = "z" * 31 }
      it { should_not be_valid }
    end

  end

  describe "when vendor confirms details from Yelp" do
    before do
     @vendor.update( FactoryGirl.attributes_for(:yelp) )
   end
    it { should be_valid }
  end
end


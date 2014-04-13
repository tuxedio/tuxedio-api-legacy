require 'spec_helper'

describe "Customer".upcase.colorize(:light_blue) do
  let(:vendor) { FactoryGirl.create(:vendor) }

  subject { vendor }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:location) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }

#------------------------------------
  describe "\nCheck parameters for blankness".upcase.colorize(:light_blue) do
    describe "when name is not present" do
      before { vendor.name = " " }
      it { should_not be_valid }
    end

    describe "when email is not present" do
      before { vendor.email = " " }
      it { should_not be_valid }
    end

    describe "when location is not present" do
      before { vendor.location = " " }
      it { should_not be_valid }
    end
  end

  describe "\nCustomer Validation".upcase.colorize(:light_blue) do

    describe "when name is too long" do
      before { vendor.name = "z" * 51 }
      it { should_not be_valid }
    end

    describe "when location is too long" do
      before { vendor.location = "z" * 31 }
      it { should_not be_valid }
    end

    describe "when email format is invalid" do
      it "it should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                       foo@bar_baz.com foo@bar+baz.com]
        addresses.each do |invalid|
          vendor.email = invalid
          expect(vendor).not_to be_valid
        end
      end
    end

    describe "when email format is valid" do
      it "it should be valid" do
        addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        addresses.each do |valid|
          vendor.email = valid
          expect(vendor).to be_valid
        end
      end
    end

    describe "when email adresss is taken" do
      before do
        user_email_duplicate = vendor.dup
        user_email_duplicate.email = vendor.email.upcase
        user_email_duplicate.save
      end

      it { should_not be_valid }
    end

    describe "when password is not present" do
      let(:vendor) { FactoryGirl.create(:vendor) }
      before do
        vendor.password = ""
        vendor.password_confirmation = ""
      end

      it { should_not be_valid }
    end

    describe "when password doesn't match confirmation" do
      before { vendor.password_confirmation = "mismatch" }
      it { should_not be_valid }
    end

    describe "with a password that's too short" do
      before { vendor.password = vendor.password_confirmation = "a" * 5 }
      it { should be_invalid }
    end

  end

end
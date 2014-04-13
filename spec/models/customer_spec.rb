require 'spec_helper'

describe "Customer".upcase.colorize(:light_blue) do



  before { @customer =  Customer.new(name: "John Smith", email: "JohnSmith@example.com", location: "Boulder",
                            password: "mypassword", password_confirmation: "mypassword") }

  ## Dummy Vendors
  before do
    Vendor.create(name: "Larkburger", email: "Vendor1@example.com", location: "Boulder",
                  password: "mypassword1", password_confirmation: "mypassword1")

    Vendor.create(name: "Sushi Tora", email: "Vendor2@example.com", location: "Boulder",
                  password: "mypassword1", password_confirmation: "mypassword1")

    Vendor.create(name: "Illegal Pete's", email: "Vendor3@example.com", location: "Boulder",
                  password: "mypassword1", password_confirmation: "mypassword1")
  end

  subject { @customer }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:location) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:bio) }
  it { should respond_to(:top_choices) }

  it { should be_valid }

#------------------------------------
  describe "\nCheck parameters for blankness".upcase.colorize(:light_blue) do
    describe "when name is not present" do
      before { @customer.name = " " }
      it { should_not be_valid }
    end

    describe "when email is not present" do
      before { @customer.email = " " }
      it { should_not be_valid }
    end

    describe "when location is not present" do
      before { @customer.location = " " }
      it { should_not be_valid }
    end
  end

  describe "\nCustomer Validation".upcase.colorize(:light_blue) do

    describe "when name is too long" do
      before { @customer.name = "z" * 51 }
      it { should_not be_valid }
    end

    describe "when location is too long" do
      before { @customer.location = "z" * 31 }
      it { should_not be_valid }
    end

    describe "when email format is invalid" do
      it "it should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                       foo@bar_baz.com foo@bar+baz.com]
        addresses.each do |invalid|
          @customer.email = invalid
          expect(@customer).not_to be_valid
        end
      end
    end

    describe "when email format is valid" do
      it "it should be valid" do
        addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        addresses.each do |valid|
          @customer.email = valid
          expect(@customer).to be_valid
        end
      end
    end

    describe "when email adresss is taken" do
      before do
        user_email_duplicate = @customer.dup
        user_email_duplicate.email = @customer.email.upcase
        user_email_duplicate.save
      end

      it { should_not be_valid }
    end

    describe "when password is not present" do
      before do
        @customer = Customer.new(name: "John Smith", email: "JohnSmith@example.com", location: "Boulder",
                                 password: "", password_confirmation: "")
      end

      it { should_not be_valid }
    end

    describe "when password doesn't match confirmation" do
      before { @customer.password_confirmation = "mismatch" }
      it { should_not be_valid }
    end

    describe "with a password that's too short" do
      before { @customer.password = @customer.password_confirmation = "a" * 5 }
      it { should be_invalid }
    end
  end
#------------------------------------
# Bio
  describe "\nbio".upcase.colorize(:light_blue) do
    describe "when customer has a bio" do
      before { @customer.bio = "Ipsum schplitsum" }
      it { should be_valid }
    end

    describe "when customer does not have bio" do
      before { @customer.bio = "" }
      it { should be_valid }
    end
  end

  #------------------------------------
  ## Top 3
  describe "\ntop 3".upcase.colorize(:light_blue) do

    describe "when customer has valid top 3" do
      before { @customer.update( top_choices: ["Larkburger", "Sushi Tora", "Illegal Pete's"] ) }
      it { should be_valid }
    end

    describe "when a customer has invalid top 3" do
      before { @customer.update( top_choices: ["Larkburger", "Sushi Tora", "Blah"] ) }
      it { should_not be_valid }
    end
  end
  #------------------------------------
  # Itinerary
  describe "\nitinerary".upcase.colorize(:light_blue) do
    describe "when a customer has a valid itinerary" do
    end

    describe "when a customer has a invalid itinerary" do
    end
  end
end

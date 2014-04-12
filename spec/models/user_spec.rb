require 'spec_helper'

describe "User".upcase.colorize(:light_blue) do
  before { @user = User.new(name: "John Smith", email: "JohnSmith@example.com", location: "Boulder",
                            password: "mypassword", password_confirmation: "mypassword")  }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:location) }

  it { should be_valid }

#------------------------------------
  describe "\nCheck parameters for blankness".upcase.colorize(:light_blue) do
    describe "when name is not present" do
      before { @user.name = " " }
      it { should_not be_valid }
    end

    describe "when email is not present" do
      before { @user.email = " " }
      it { should_not be_valid }
    end

    describe "when location is not present" do
      before { @user.location = " " }
      it { should_not be_valid }
    end
  end

#------------------------------------
  describe "\nUser Roles".upcase.colorize(:light_blue) do

    describe "when name is too long" do
      before { @user.name = "z" * 51 }
      it { should_not be_valid }
    end

    describe "\nVendor location".upcase.colorize(:light_blue) do
      describe "when vendor location is valid" do
        before { @user.user_role = "Vendor"}
        before { @user.location = User.allowed_locations.sample }
        it { should be_valid }
      end

      describe "when vendor location is invalid" do
        before { @user.user_role = "Vendor"}
        before { @user.location   = "Invalid" }
        it { should_not be_valid }
      end
    end
  end

#------------------------------------
  describe "\nLength of inputs".upcase.colorize(:light_blue) do
    describe "when name is too long" do
      before { @user.name = "z" * 51 }
      it { should_not be_valid }
    end

    describe "when location is too long" do
      before { @user.location = "z" * 31 }
      it { should_not be_valid }
    end
  end

#------------------------------------
  describe "\nEmail address".upcase.colorize(:light_blue) do
    describe "when email format is invalid" do
      it "it should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                       foo@bar_baz.com foo@bar+baz.com]
        addresses.each do |invalid|
          @user.email = invalid
          expect(@user).not_to be_valid
        end
      end
    end

    describe "when email format is valid" do
      it "it should be valid" do
        addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        addresses.each do |valid|
          @user.email = valid
          expect(@user).to be_valid
        end
      end
    end

    describe "when email adresss is taken" do
      before do
        user_email_duplicate = @user.dup
        user_email_duplicate.email = @user.email.upcase
        user_email_duplicate.save
      end

      it { should_not be_valid }
    end
  end
#------------------------------------
  describe "\nPassword validation".upcase.colorize(:light_blue) do
    describe "when password is not present" do
      before do
        @user = User.new(name: "John Smith", email: "JohnSmith@example.com", location: "Boulder",
                         vendor: false, customer: true, blogger: false,
                         password: "", password_confirmation: "")
      end

      it { should_not be_valid }
    end

    describe "when password doesn't match confirmation" do
      before { @user.password_confirmation = "mismatch" }
      it { should_not be_valid }
    end

    describe "with a password that's too short" do
      before { @user.password = @user.password_confirmation = "a" * 5 }
      it { should be_invalid }
    end
  end
end

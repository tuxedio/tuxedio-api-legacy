require 'spec_helper'

describe User do
  before { @user = User.new(name: "John Smith", email: "JohnSmith@example.com",
                            location: "Boulder", vendor: false, customer: true, blogger: false) }

  subject { @user }

  it { should respond_to(:name)     }
  it { should respond_to(:email)    }
  it { should respond_to(:location) }
  it { should respond_to(:vendor)   }
  it { should respond_to(:customer) }
  it { should respond_to(:blogger)  }

  it { should be_valid }

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

  describe "when user type is valid" do
    before { @user.customer = true }
    before { @user.vendor   = false }
    before { @user.blogger  = false }
    it { should be_valid }
  end

  describe "when user type is invalid" do
    before { @user.customer = true }
    before { @user.vendor   = true }
    before { @user.blogger  = true }
    it { should_not be_valid }
  end

  describe "when user type is invalid" do
    before { @user.customer = false }
    before { @user.vendor   = true }
    before { @user.blogger  = true }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "z" * 51 }
    it { should_not be_valid }
  end

  describe "when location is too long" do
    before { @user.location = "z" * 31 }
    it { should_not be_valid }
  end

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

  describe "when email adress is taken" do
    before do
      user_email_duplicate = @user.dup
      user_email_duplicate.email = @user.email.upcase
      user_email_duplicate.save
    end

    it { should_not be_valid }
  end
end

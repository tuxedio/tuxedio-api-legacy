require 'spec_helper'

describe "Customer".upcase.colorize(:light_blue) do
  before { @customer = 
           Customer.new(name: "John Smith", email: "JohnSmith@example.com", location: "Boulder",
                        password: "mypassword", password_confirmation: "mypassword")  }

  subject { @customer }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:location) }
  it { should respond_to(:bio) }

  it { should be_valid }

#------------------------------------
# Type
  describe "\ncustomer user_role".upcase.colorize(:light_blue) do
    describe "when customer type is valid" do
      before { @customer.user_role = "Customer" }
      it { should be_valid }
    end

    describe "when customer type is valid" do
      before { @customer.user_role = "Invlaid" }
      it { should_not be_valid }
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
      before { @customer.choice_1 = "Larkburger"    }
      before { @customer.choice_2 = "Sushi Tora"    }
      before { @customer.choice_3 = "Chataqua Park" }
      it { should be_valid }
    end

    describe "when a customer has invalid top 3" do
      before { @customer.choice_1 = "Larkburger"    }
      before { @customer.choice_2 = "Sushi Tora"    }
      before { @customer.choice_3 = "DuzNotExist"   }
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

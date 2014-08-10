require 'spec_helper'

describe "Person".upcase.colorize(:light_blue) do



  before { @person = FactoryGirl.build(:person).rolable }

  ## Dummy Vendors
  before do
    FactoryGirl.create(:vendor1)
    FactoryGirl.create(:vendor2)
    FactoryGirl.create(:vendor3)
  end



  subject { @person }

  it { should respond_to(:name) }
  it { should respond_to(:gender) }
  it { should respond_to(:date_of_birth) }

  it { should respond_to(:location) }

  it { should respond_to(:bio) }
  it { should respond_to(:top_choices) }
  it { should respond_to(:picture_file_name) }
  it { should respond_to(:picture_content_type) }
  it { should respond_to(:picture_file_size) }

  it { should be_valid }

  #------------------------------------
  describe "\nCheck parameters for blankness".upcase.colorize(:light_blue) do
    describe "when name is not present" do
      before { @person.name = " " }
      it { should_not be_valid }
    end

    describe "when location is not present" do
      before { @person.location = " " }
      it { should_not be_valid }
    end
  end

  describe "\nPerson Validation".upcase.colorize(:light_blue) do

    describe "when name is too long" do
      before { @person.name = "z" * 51 }
      it { should_not be_valid }
    end

    describe "when location is too long" do
      before { @person.location = "z" * 31 }
      it { should_not be_valid }
    end
  end

  #------------------------------------
  # Bio
  describe "\nbio".upcase.colorize(:light_blue) do
    describe "when person has a bio" do
      before { @person.bio = "Ipsum schplitsum" }
      it { should be_valid }
    end

    describe "when person does not have bio" do
      before { @person.bio = "" }
      it { should be_valid }
    end

    describe "when person has invalid gender" do
      before { @person.gender = "Mail" }
      it { should_not be_valid }
    end

    describe "when person has invalid date_of_birth" do
      before { @person.date_of_birth = "A few years ago" }
      it { should_not be_valid }
    end
  end

  #------------------------------------
  ## Top 3
  describe "\ntop 3".upcase.colorize(:light_blue) do

    describe "when person has valid top 3" do
      before { @person.update(top_choices: ["Larkburger", "Sushi Tora", "Illegal Pete's"]) }
      it { should be_valid }
    end

    describe "when a person has invalid top 3" do
      before { @person.update(top_choices: ["Larkburger", "Sushi Tora", "Blah"]) }
      it { should_not be_valid }
    end
  end
  #------------------------------------
  # Journey
  describe "\njourney".upcase.colorize(:light_blue) do
    describe "when a person has a valid journey" do
    end

    describe "when a person has a invalid journey" do
    end
  end

  #------------------------------------
  # Profile/Experience Picture
  describe "\npictures".upcase.colorize(:light_blue) do
    describe "when a person has a profile picture" do
      before { @person.picture_file_name = "FishShapes.jpg" }
      it { should be_valid }
    end

    describe "when a person's picture is too large" do
      before { @person.picture_file_size = 63067000 }
      it { should_not be_valid }
    end

    describe "when a person's picture is an okay size" do
      before { @person.picture_file_size = 630670 }
      it { should be_valid }
    end

    describe "when a person's picture is the default image" do
      before { @person.picture_file_name = nil }
      it { should be_valid }
    end
  end

  #------------------------------------
  # Current Adventure
  describe "\ncurrent adventure".upcase.colorize(:light_blue) do
    describe "when a invalid adventure_id is passed" do
      before { @adventure = FactoryGirl.create(:adventure, person: @person) }
      it { expect(@person.current_adventure(3214451324)).to eq(@adventure) }
    end

    describe "when a valid adventure_id is passed" do
      before { @adventure = FactoryGirl.create(:adventure, person: @person) }
      it { expect(@person.current_adventure(@adventure)).to eq(@adventure) }
    end

    describe "with multiple adventures" do
      describe "with invalid adventure_id" do
        before { @adventure1 = FactoryGirl.create(:adventure, person: @person) }
        before { @adventure2 = FactoryGirl.create(:adventure, person: @person) }
        # Should be adventures.last
        it { expect(@person.current_adventure(12345)).to eq(@adventure2) }
      end

      describe "with valid adventure_id" do
        before { @adventure1 = FactoryGirl.create(:adventure, person: @person) }
        before { @adventure2 = FactoryGirl.create(:adventure, person: @person) }
        it { expect(@person.current_adventure(@adventure1)).to eq(@adventure1) }
      end
    end
  end
end

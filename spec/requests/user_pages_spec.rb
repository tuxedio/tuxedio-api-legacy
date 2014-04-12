require 'spec_helper'

describe "User pages".upcase.colorize(:light_blue) do
  subject { page }

  describe "signup page" do
    before { visit registration_choice_path }

    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }
  end

  describe "register customer" do

    before { visit new_customer_registration_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      before do
        fill_in "Name",         with: ""
        fill_in "Email",        with: "user@example"
        fill_in "Location",     with: "Invalid"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar2"
      end

      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Location",     with: "Boulder"
        fill_in "Password",     with: "foobar123"
        fill_in "Confirmation", with: "foobar123"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_link('Sign out') }
        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
    end
  end
end

require 'spec_helper'

describe "Customer Sign-in pages".upcase.colorize(:light_blue) do
  subject { page }

  describe "signup page" do
    before { visit registration_choice_path }

    it { should have_content('Sign up') }
    it { should have_link('Register Customer', href: new_customer_registration_path) }
    it { should have_link('Register Vendor', href: new_vendor_registration_path) }
  end

  describe "register customer" do

    before { visit new_customer_registration_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      before do
        fill_in "Name",         with: ""
        fill_in "Email",        with: "customer@example"
        fill_in  "Location",    with: "Invalid"
        fill_in "Password",     with: "short"
        fill_in "Confirmation", with: "short2"
      end

      it "should not create a customer" do
        expect { click_button submit }.not_to change(Customer, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example Customer"
        fill_in "Email",        with: "customer@example.com"
        fill_in "Location",     with: "Boulder"
        fill_in "Password",     with: "foobar123"
        fill_in "Confirmation", with: "foobar123"
      end

      it "should create a customer" do
        expect { click_button submit }.to change(Customer, :count).by(1)
      end

      describe "after saving the customer" do
        before { click_button submit }
        let(:customer) { Customer.find_by(email: 'customer@example.com') }

        it { should have_link('Sign in') }
        it { should have_content("Sign up") }

        it { should have_selector('div.alert.alert-info', text: 'A message with a confirmation link has been sent to your email address. Please open the link to activate your account.') }
      end
    end
  end
end

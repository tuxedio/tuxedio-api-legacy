require 'spec_helper'

describe "Customer Authentication".upcase.colorize(:light_blue) do

  subject { page }

  describe "signin page" do
    before { visit new_customer_session_path }

    it { should have_content('Sign in') }
    it { should have_title('Tuxedo | Sign in') }
  end
  describe "signin" do
    before { visit new_customer_session_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_content('Sign in') }
      it { should have_selector('div.alert.alert-alert') }

      describe "after visiting another page" do
        before { visit root_path }
        it { should_not have_selector('div.alert.alert-alert') }
      end
    end


    describe "with valid information" do
      let(:customer) { FactoryGirl.create(:customer) }
      before do
        customer.confirm!
        fill_in "Email",    with: customer.email.upcase
        fill_in "Password", with: customer.password
        click_button "Sign in"
      end

      #it { should have_title("Tuxedio | " + user.name) }
      it { should have_link('Account Settings',     href: edit_customer_registration_path) }
      it { should have_link('Sign out',    href: destroy_customer_session_path) }
      it { should_not have_link('Sign in',    href: new_customer_session_path) }
      it {should have_selector('div.alert.alert-notice', text:'Signed in successfully.')}

      describe "after visiting another page" do
        before { visit root_path }
        it { should_not have_selector('div.alert.alert-notice') }
      end

      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end
    end
  end
end

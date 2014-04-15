require 'spec_helper'
SimpleCov.command_name 'RSPEC TESTING'

describe "StaticPages".upcase.colorize(:light_blue) do
  describe "Home page" do
    before { visit root_path }
    it "should have the content 'Tuxedio'" do
      expect(page).to have_content('Tuxedo')
    end
    it "should have the right title" do
      expect(page).to have_title("Tuxedo | Home")
    end
  end

end

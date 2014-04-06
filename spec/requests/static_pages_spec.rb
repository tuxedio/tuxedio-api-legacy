require 'spec_helper'

describe "StaticPages".upcase.colorize(:light_blue) do
  describe "Home page" do
    before { visit root_path }
    it "should have the content 'Tuxedio'" do
      expect(page).to have_content('Tuxedio')
    end
    it "should have the right title" do
      expect(page).to have_title("Tuxedio | Home")
    end
  end

end

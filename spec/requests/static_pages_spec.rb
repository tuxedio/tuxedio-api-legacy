require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "should have the content 'Tuxedio'" do
      visit '/static_pages/home'
      expect(page).to have_content('Tuxedio')
    end
    it "should have the right title" do
      visit '/static_pages/home'
      expect(page).to have_title("Tuxedio | Home")
    end
  end

end

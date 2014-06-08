Feature: Vendor Profile
  As a vendor
  So that I can view my profile
  I want to click a button on in the navigation that will take me to my profile.

Scenario: A logged in vendor can see their profile
  Given I am signed in as a vendor
  When I click the link "View My Account"
  Then I should be on the vendor profile page
  And I should see the "Edit Profile" link
  And I should see the "Add an activity" link
  And I should see the text "Example Vendor"
  And I should see the text "Boulder"

Scenario: If logged out, there is no link to vendor account
  Given I visit the home page
  Then I should see the "Sign in" link
  And I should not see the "View My Account" link
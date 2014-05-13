Feature: Customer Profile
  As a customer
  So that I can view my profile
  I want to access my profile from the nav

Scenario: Logged In Customer
  Given I am signed in as a customer
  When I click the link "View Profile"
  Then I should be on the customer profile page

Scenario: Logged-out Customer
  Given I visit the home page
  Then I should see the "Sign in" link
  And I should not see the "View Profile" link

Feature: Person Profile
  As a person
  So that I can view my profile
  I want to access my profile from the nav

Scenario: Logged In Person
  Given I am signed in as a person
  When I click the link "View Profile"
  Then I should be on the person profile page

Scenario: Logged-out Person
  Given I visit the home page
  Then I should see the "Sign in" link
  And I should not see the "View Profile" link

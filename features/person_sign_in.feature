Feature: Person Sign-in Process
  As a Person
  So I can use the site
  I want to sign-in

Background:
  Given a person exists
  And that person is confirmed

Scenario: Unsuccessful sign-in
  Given I visit the new person session page
  When I fill in the following:
  | field    | value               |
  | Email    | invalid@invalid.com |
  | Password |                     |
  And I click the button "Sign in"
  Then I should see a warning message

Scenario: Successful sign-in/sign-out
  Given I visit the new person session page
  When I fill in the following:
  | field    | value                |
  | Email    | person@example.com |
  | Password | foobar1234           |
  And I click the button "Sign in"
  Then I should be on the explore page
  When I click the link "Sign out"
  Then I should be on the home page
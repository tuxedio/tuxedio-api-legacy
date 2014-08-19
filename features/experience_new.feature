Feature: As a business, so that I can list my experiences and services to my people, I want to add an experience through the "Add an experience" link on my profile page

Background: A user is logged in
  Given a vendor exists
  And I sign in as that user

Scenario: The vendor should be able to click add an experience
  When the vendor clicks the "View My Account" link
  And the vendor clicks the "Add an experience" link
  Then the vendor should see the "Add an experience" page

Scenario: The vendor should be able to add a new experience and see it on their profile
  Given the vendor visits the "Add an experience" page
  When the vendor submits valid experience information
  Then the vendor should see the "Add experience time" page
  Given the vendor submits valid time information
  Then the vendor should see their new experience

Scenario: The vendor should not be able to submit an invalid experience
  Given the vendor visits the "Add an experience" page
  When the vendor submits invalid experience information
  Then the vendor should redirect to the "Add an experience" page
  And the vendor should see warnings

Scenario: A user is logged out
  When the vendor clicks the "Sign out" link
  And a user visits the "Add an experience" page
  Then I should be on the new user session page

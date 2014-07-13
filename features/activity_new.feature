Feature: As a business, so that I can list my activities and services to my people, I want to add an activity through the "Add an activity" link on my profile page

Background: A user is logged in
  Given a vendor is logged in

Scenario: The vendor should be able to click add an activity
  When the vendor clicks the "View My Account" link
  And the vendor clicks the "Add an activity" link
  Then the vendor should see the "Add an activity" page

Scenario: The vendor should be able to add a new activity and see it on their profile
  Given the vendor visits the "Add an activity" page
  When the vendor submits valid activity information
  Then the vendor should see the "Add activity time" page
  Given the vendor submits valid time information
  Then the vendor should see their new activity

Scenario: The vendor should not be able to submit an invalid activity
  Given the vendor visits the "Add an activity" page
  When the vendor submits invalid activity information
  Then the vendor should redirect to the "Add an activity" page
  And the vendor should see warnings

Scenario: A user is logged out
  When the vendor clicks the "Sign out" link
  And a user visits the "Add an activity" page
  Then they should see the vendor sign in page

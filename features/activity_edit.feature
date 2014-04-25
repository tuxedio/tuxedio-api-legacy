Feature: As a vendor, so that I can change attributes within my listed activities, I want to edit my activities

Background: A user is logged in
  Given a vendor is logged in
  And a vendor has an activity

Scenario: Do a valid edit from the profile page
  When the vendor clicks the "View My Account" link
  And the vendor clicks the "Edit Activity" link
  Then the vendor should see the "Edit an Activity" page
  When the vendor makes a valid change to activity information
  Then the vendor should see their changed activity


Scenario: Do an invalid edit from the profile page
  When the vendor clicks the "View My Account" link
  And the vendor clicks the "Edit Activity" link
  Then the vendor should see the "Edit an Activity" page
  When the vendor makes a invalid change to activity information
  Then the vendor should redirect to the edit an activity page
  And the vendor should see warnings

Scenario: A logged out user should not be able to acces the edit activity page
  When the vendor clicks the "Sign out" link
  And the vendor visits the edit an activity page
  Then they should see the vendor sign in page

Scenario: Add time from the profile page
  When the vendor clicks the "View My Account" link
  And the vendor clicks the "Edit Activity" link
  Then the vendor should see the "Edit an Activity" page
  And the vendor clicks the "Add activity time" link
  Then the vendor should see the "Add activity time" page

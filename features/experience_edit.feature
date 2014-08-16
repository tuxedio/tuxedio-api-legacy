Feature: As a vendor, so that I can change attributes within my listed experiences, I want to edit my experiences

Background: A user is logged in
  Given a vendor exists
  And I sign in as that user
  And that vendor has an experience

Scenario: Do a valid edit from the profile page
  When the vendor clicks the "View My Account" link
  And the vendor clicks the "Edit Experience" link
  Then the vendor should see the "Edit an Experience" page
  When the vendor makes a valid change to experience information
  Then the vendor should see their changed experience


Scenario: Do an invalid edit from the profile page
  When the vendor clicks the "View My Account" link
  And the vendor clicks the "Edit Experience" link
  Then the vendor should see the "Edit an Experience" page
  When the vendor makes a invalid change to experience information
  Then the vendor should redirect to the edit an experience page
  And the vendor should see warnings

Scenario: A logged out user should not be able to acces the edit experience page
  When the vendor clicks the "Sign out" link
  And the vendor visits the edit an experience page
  Then they should see the vendor sign in page

Scenario: Add time from the profile page
  When the vendor clicks the "View My Account" link
  And the vendor clicks the "Edit Experience" link
  Then the vendor should see the "Edit an Experience" page
  And the vendor clicks the "Add experience time" link
  Then the vendor should see the "Add experience time" page

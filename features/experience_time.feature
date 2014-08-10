Feature: As a business, so that I can list my specific experiences and services to my people, I want to add an experience time an experience

Background: A user is logged in
  Given a vendor is logged in

Scenario: The vendor should be able to add a new experience time
  Given the vendor visits the "Add an experience" page
  When the vendor submits valid experience information
  Then the vendor should see the "Add experience time" page
  Given the vendor submits valid time information
  Then the vendor should see their new experience

Scenario: The vendor should not be able to add an invalid experience time
  Given the vendor visits the "Add an experience" page
  When the vendor submits valid experience information
  Then the vendor should see the "Add experience time" page
  Given the vendor submits invalid time information
  Then they should see "warning" flash

Feature: As a business, so that I can list my specific activities and services to my people, I want to add an activity time an activity

Background: A user is logged in
  Given a vendor is logged in

Scenario: The vendor should be able to add a new activity time 
  Given the vendor visits the "Add an activity" page
  When the vendor submits valid activity information
  Then the vendor should see the "Add activity time" page
  Given the vendor submits valid time information
  Then the vendor should see their new activity

Scenario: The vendor should not be able to add an invalid activity time 
  Given the vendor visits the "Add an activity" page
  When the vendor submits valid activity information
  Then the vendor should see the "Add activity time" page
  Given the vendor submits invalid time information
  Then they should see "warning" flash 


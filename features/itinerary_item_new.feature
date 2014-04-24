@explore
Feature: As a logged in customer, So I can keep track of my chosen activities, I want to add activities to my itinerary

Background:
  Given a customer is logged in

Scenario: A customer fills in Add and activity with valid information
  Given a customer visits the "explore" page
  When the customer selects an activity to add
  And the customer submits valid itinerary item information
  Then the customer should see a success flash

Scenario: A customer fills in add an activity with invalid information
  Given a customer visits the "explore" page
  When the customer selects an activity to add
  And the customer submits invalid itinerary item information
  Then the customer should see a warning

Scenario: A customer is not logged in
  Given a customer clicks the "Sign out" link
  And a customer visits the "explore" page
  When the customer selects an activity to add
  Then the customer should see the "/customers/sign_in" page
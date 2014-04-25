@explore
Feature: As a user, I should be able to view activities with the explore page.

  Background: A customer adds a trip successfully
  Scenario: Customer (signed in)
    Given a customer is logged in
    When the customer clicks the "Explore" link
    Then the customer should see the "/explore" page
    Then the customer should see activities displayed
    When the customer clicks an Add to trip link
    Then they should see the "Add an activity" page
    When the customer clicks the "Add to my trip" button
    Then the customer should see their item in intinerary cart

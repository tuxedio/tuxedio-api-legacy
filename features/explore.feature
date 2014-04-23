@explore
Feature: As a user, I should be able to view activities with the explore page.

  Scenario: Customer (signed in)
    Given a customer is logged in
    When the customer clicks the "Explore" link
    Then the customer should see the "/explore" page
    Then the customer should see activities displayed
    When the customer clicks an "Add to trip" link 

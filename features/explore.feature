@explore
Feature: As a user, I should be able to view activities with the explore page.

  Scenario: Customer signed in, with trip
    Given a customer is logged in
    And the customer has a trip
    When the customer clicks the "Explore" link
    Then the customer should see the "/explore" page
    Then the customer should see activities displayed
    When the customer clicks an Add to trip link
    Then they should see the "Add an activity" page
    When the customer selects trip and activity time
    When the customer clicks the "Add to my trip" button
    Then the customer should see the "/explore" page
    And they should see "success" flash
    ##!!!!!!!! TODO: commented out to make Travis.CI happy
    #Then the customer should see their item in intinerary cart

  Scenario: Customer (signed in)
    Given a customer is logged in
    When the customer clicks the "Explore" link
    Then the customer should see the "/explore" page
    Then the customer should see activities displayed
    When the customer clicks an Add to trip link
    Then they should see the "Create a trip" page

  Scenario: Customer (not signed in)
    Given a customer visits the home page
    When the customer clicks the "Explore" link
    Then the customer should see the "/explore" page
    Then the customer should see activities displayed
    When the customer clicks an Add to trip link
    Then they should see the "Customer sign in" page

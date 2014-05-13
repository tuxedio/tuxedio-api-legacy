@explore
Feature: As a user, I should be able to view activities with the explore page.

Background:
    Given I am signed in as a customer

  Scenario: Signed in customer adds item to trip
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
    Then the intinerary cart should not be empty

  Scenario: Signed in customer removes item from trip
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
    Then the intinerary cart should not be empty
    When I check "delete_" field
    And the customer clicks the "Update trip" button
    Then the intinerary cart should be empty
    And the customer should see the "/explore" page

  Scenario: Signed in customer updates with no trip selected
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
    Then the intinerary cart should not be empty
    And the customer clicks the "Update trip" button
    Then the intinerary cart should not be empty
    And the customer should see the "/explore" page

  Scenario: Customer (signed in)
    When the customer clicks the "Explore" link
    Then the customer should see the "/explore" page
    Then the customer should see activities displayed
    When the customer clicks an Add to trip link
    Then they should see the "Create a trip" page

  Scenario: Customer (not signed in)
    Given I sign out as a customer
    When the customer clicks the "Explore" link
    Then the customer should see the "/explore" page
    Then the customer should see activities displayed
    When the customer clicks an Add to trip link
    Then they should see the "Customer sign in" page

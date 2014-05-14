@explore
Feature: Explore Activities
    As a user
    So I can browse the available activities
    I want a list of activities.

Background:
    Given I am signed in as a customer
    Given I have created a trip
    When I visit the explore page
    Then I should see activities displayed

  Scenario: Customer adds and removes itinerary item
    When I click the link "Add to trip"
    Then I should be on the new trips itinerary items page
    When I select a trip and activity time
    And I click the button "Add to my trip"
    Then I should be on the explore page
    And I should see a success message
    And My intinerary cart should not be empty
    When I click the button "Update trip"
    Then My intinerary cart should not be empty
    When I check "delete_" field
    And I click the button "Update trip"
    Then the intinerary cart should be empty

  Scenario: Customer has no trip
    Given I have no trips
    And I visit the explore page
    When I click the link "Add to trip"
    Then I should be on the new trips page

  Scenario: Add to trip when not signed in
    Given I sign out as a customer
    When I visit the explore page
    Then I should see activities displayed
    When I click the link "Add to trip"
    Then I should be on the new customer session page
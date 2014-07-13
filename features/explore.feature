@explore
Feature: Explore Activities
    As a user
    So I can browse the available activities
    I want a list of activities.

Background:
    Given I am signed in as a customer
    Given I have created a adventure
    When I visit the explore page
    Then I should see activities displayed

  Scenario: Customer adds and removes itinerary item
    When I click the link "Add to adventure"
    Then I should be on the new adventures itinerary items page
    When I select a adventure and activity time
    And I click the button "Add to my adventure"
    Then I should be on the explore page
    And I should see a success message
    And My intinerary cart should not be empty
    When I click the button "Update adventure"
    Then My intinerary cart should not be empty
    When I check "delete_" field
    And I click the button "Update adventure"
    Then the intinerary cart should be empty

  Scenario: Customer has no adventure
    Given I have no adventures
    And I visit the explore page
    When I click the link "Add to adventure"
    Then I should be on the new adventures page

  Scenario: Add to adventure when not signed in
    Given I sign out as a customer
    When I visit the explore page
    Then I should see activities displayed
    When I click the link "Add to adventure"
    Then I should be on the new customer session page
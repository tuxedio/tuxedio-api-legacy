@explore
Feature: Explore Experiences
    As a user
    So I can browse the available experiences
    I want a list of experiences.

Background:
    Given I am signed in as a person
    Given I have created a adventure
    When I visit the explore page
    Then I should see experiences displayed

  Scenario: Person adds and removes journey item
    When the person clicks an Add to adventure link
    Then I should be on the new adventures journey items page
    When I select a adventure and experience time
    And I click the button "Add to my adventure"
    Then I should be on the explore page
    And I should see a success message
    And My intinerary cart should not be empty
    When I click the button "Update adventure"
    Then My intinerary cart should not be empty
    When I check "delete_" field
    And I click the button "Update adventure"
    Then the intinerary cart should be empty

  Scenario: Person has no adventure
    Given I have no adventures
    And I visit the explore page
    When the person clicks an Add to adventure link
    Then I should be on the new adventures page

  Scenario: Add to adventure when not signed in
    Given I sign out as a person
    When I visit the explore page
    Then I should see experiences displayed
    When the person clicks an Add to adventure link
    Then I should be on the new user session page

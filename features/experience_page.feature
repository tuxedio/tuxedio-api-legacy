Feature: As a person, so that I can learn more about an experience, I want to view an experience's page

		@explore
  Scenario: Person navigates to experience page
    Given I am signed in as a person
    When the person clicks the "Explore" link
    Then the person should see the "/explore" page
    Then the person should see experiences displayed
    When the person clicks an image
    Then the person should see the experience's page

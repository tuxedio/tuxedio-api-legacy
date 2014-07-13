Feature: As a person, so that I can learn more about an activity, I want to view an activity's page

		@explore
  Scenario: Person navigates to activity page
    Given I am signed in as a person
    When the person clicks the "Explore" link
    Then the person should see the "/explore" page
    Then the person should see activities displayed
    When the person clicks an image
    Then the person should see the activity's page

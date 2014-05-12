Feature: As a customer, so that I can learn more about an activity, I want to view an activity's page

		@explore
  Scenario: Customer navigates to activity page
    Given a customer is logged in
    When the customer clicks the "Explore" link
    Then the customer should see the "/explore" page
    Then the customer should see activities displayed
    When the customer clicks an image
    Then the customer should see the activity's page

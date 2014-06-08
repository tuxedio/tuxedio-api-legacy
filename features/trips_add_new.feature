Feature: Create a new trip
  As a customer
  So I can create itineraries of my activities
  I want to make a trip

Background:
  Given I am signed in as a customer
  And I visit the customer profile page
  When I click the link "View my upcoming trips"
  Then I should be on the new customers trips page

Scenario: A customer can adds a trips successfully
  When I fill in the following:
  | field               | value  |
  | trip_trip_name      | Trip 1 |
  | trip_number_of_days | 1      |
  And I click the button "Create trip"
  Then I should be on the customers trips page
  Then I should see the text "Trip 1"
  When the customer clicks the "Create a new Trip" link
  And I fill in the following:
  | field               | value  |
  | trip_trip_name      | Trip 2 |
  | trip_number_of_days | 1      |
  And I click the button "Create trip"
  Then I should see the text "Trip 1"
  And I should see the text "Trip 2"

Scenario: A customer gives invalid input when creating a trip
  When I fill in the following:
  | field               | value  |
  | trip_trip_name      |        |
  | trip_number_of_days | 0      |
  And I click the button "Create trip"
  Then I should see a warning message

Scenario: A customer is not logged in and trys to access the create a trip page
  When I click the link "Sign out"
  And I visit the customers trips page
  Then I should be on the new customer session page
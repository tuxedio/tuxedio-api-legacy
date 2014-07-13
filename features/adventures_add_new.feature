Feature: Create a new adventure
  As a customer
  So I can create itineraries of my activities
  I want to make a adventure

Background:
  Given I am signed in as a customer
  And I visit the customer profile page
  When I click the link "View my upcoming adventures"
  Then I should be on the new customers adventures page

Scenario: A customer can adds a adventures successfully
  When I fill in the following:
  | field               | value  |
  | adventure_name      | Adventure 1 |
  | adventure_number_of_days | 1      |
  And I click the button "Create adventure"
  Then I should be on the customers adventures page
  Then I should see the text "Adventure 1"
  When the customer clicks the "Create a new Adventure" link
  And I fill in the following:
  | field               | value  |
  | adventure_name      | Adventure 2 |
  | adventure_number_of_days | 1      |
  And I click the button "Create adventure"
  Then I should see the text "Adventure 1"
  And I should see the text "Adventure 2"

Scenario: A customer gives invalid input when creating a adventure
  When I fill in the following:
  | field               | value  |
  | adventure_name      |        |
  | adventure_number_of_days | 0      |
  And I click the button "Create adventure"
  Then I should see a warning message

Scenario: A customer is not logged in and trys to access the create a adventure page
  When I click the link "Sign out"
  And I visit the customers adventures page
  Then I should be on the new customer session page
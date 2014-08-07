Feature: Create a new adventure
  As a person
  So I can create itineraries of my experiences
  I want to make a adventure

Background:
  Given I am signed in as a person
  And I visit the person profile page
  When I click the link "View my upcoming adventures"
  Then I should be on the new people adventures page

Scenario: A person can adds a adventures successfully
  When I fill in the following:
  | field               | value  |
  | adventure_name      | Adventure 1 |
  | adventure_number_of_days | 1      |
  And I click the button "Create adventure"
  Then I should be on the people adventures page
  Then I should see the text "Adventure 1"
  When the person clicks the "Create a new Adventure" link
  And I fill in the following:
  | field               | value  |
  | adventure_name      | Adventure 2 |
  | adventure_number_of_days | 1      |
  And I click the button "Create adventure"
  Then I should see the text "Adventure 1"
  And I should see the text "Adventure 2"

Scenario: A person gives invalid input when creating a adventure
  When I fill in the following:
  | field               | value  |
  | adventure_name      |        |
  | adventure_number_of_days | 0      |
  And I click the button "Create adventure"
  Then I should see a warning message

Scenario: A person is not logged in and trys to access the create a adventure page
  When I click the link "Sign out"
  And I visit the people adventures page
  Then I should be on the new user session page
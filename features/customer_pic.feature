Feature: Image Upload via Paperclip
  As a customer
  So I can see my picture
  I want to be able to upload my picture

@paperclip
Scenario: An image is chosen
  Given I visit the new customer registration page
  And I sign up as a customer with an image
  And I sign in as that customer
  When I click the link "View Profile"
  Then I should see my profile picture

Scenario: No image is chosen
  Given a customer exists
  And I sign in as that customer
  When I click the link "View Profile"
  Then I should see the default image

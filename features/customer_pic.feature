
Feature: As a customer, so that I can see my picture, I want to be able to go to my profile page and see my picture.

Scenario: A logged in customer can see their picture
  Given a customer has signed up with a profile picture
  And the customer with profile picture signs in
  When the customer clicks the "View Profile" link
  Then the customer should see their profile picture

@paperclip

Scenario: If the customer did not choose a picture, display the default image
  Given a customer is logged in
  And the customer has not chosen a profile picture
  Then the customer clicks the "View Profile" link
  Then the customer should see the default image for their profile picture

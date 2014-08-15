Feature: Image Upload via Paperclip
  As a person
  So I can see my picture
  I want to be able to upload my picture

@paperclip
Scenario: An image is chosen
  Given I visit the person sign up page
  And I sign up as a person with an image
  And I sign in as that user
  When I click the link "View Profile"
  Then I should see my profile picture

Scenario: No image is chosen
  Given a person exists
  And I sign in as that user
  When I click the link "View Profile"
  Then I should see the default image

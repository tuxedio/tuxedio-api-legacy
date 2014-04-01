Feature: As a site user In order to create an account I should be able to sign up using the register page

Scenario:
  Given a user visits the sign up page
  When the user submits valid signup information
  Then they should be redirected to their profile page.

Scenario:
  Given a user visits the sign up page
  When the user submits invalid signup information
  Then they should be redirected to the the sign up page
Feature: As a site user In order to create an account I should be able to sign up using the register page

Scenario:
  Given a customer visits the sign up page
  When the customer submits valid signup information
  Then they should see email confirmation notice

Scenario:
  Given a customer visits the sign up page
  When the customer submits invalid signup information
  Then they should be redirected to the the sign up page

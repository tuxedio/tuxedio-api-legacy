Feature: As a Vendor, in order to create an account I should be able to sign up using the register page

Scenario:
  Given a vendor visits the sign up page
  When the vendor submits valid signup information
  Then the vendor should see email confirmation notice

Scenario:
  Given a vendor visits the sign up page
  When the vendor submits invalid signup information
  Then vendor should be redirected to the the sign up page

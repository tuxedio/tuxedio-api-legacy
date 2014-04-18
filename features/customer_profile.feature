Feature: As a customer, so that I can view my profile, I want to click a button on in the navigation that will take me to my profile.

Scenario: A logged in customer can see their profile
  Given a customer is logged in
  When the customer clicks the "View Profile" link
  Then the customer should see their profile page

Scenario: If logged out, there is no link to customer account
  Given a customer is logged out
  Then the customer should should see the "Sign in" link
  And the customer should not see the "View Profile" link

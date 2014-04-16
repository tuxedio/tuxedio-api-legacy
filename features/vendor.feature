Feature: As a vendor, so that I can view my profile, I want to click a button on in the navigation that will take me to my profile.

Scenario: A logged in vendor can see their profile
  Given a vendor is logged in
  When the vendor clicks the "View My Account" link
  Then the vendor should see their profile page

Scenario: If logged out, there is no link to vendor account
  Given a vendor is logged out
  Then the vendor should should see the "Sign in" link
  And the vendor should not see the "View My Account" link
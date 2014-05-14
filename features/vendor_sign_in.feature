Feature: Vendor signing in (after first time)
  As a vendor
  So that I can use the site
  I want to be able to sign in

  Background:
    Given a vendor exists
    And that vendor is confirmed
    Given I visit the new vendor session page

  Scenario: Unsuccessful signin
    When I fill in the following:
      | field    | value               |
      | Email    | invalid@invalid.com |
      | Password |                     |
      And I click the button "Sign in"
      Then I should see a warning message

  Scenario: Successful signin
    When I fill in the following:
    | field    | value              |
    | Email    | vendor@example.com |
    | Password | foobar1234         |
    And I click the button "Sign in"
    Then I should be on the vendor profile page
    When I click the link "Sign out"
    Then I should be on the home pages
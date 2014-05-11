Feature: Customer Sign-up
  As a customer
  So I can create an account
  I want to be able to sign up using the register page

Background:
  Given I visit the customer registration page

Scenario: Valid Sign-up
  When I fill in the following:
    | field        | value            |
    | Name         | Example User     |
    | Email        | user@example.com |
    | Location     | Boulder          |
    | Password     | foobarfoobar     |
    | Confirmation | foobarfoobar     |
  And I click the button "Create my account"
  Then the customer should see email confirmation notice

Scenario: Invalid Sign-up
  When I fill in the following:
    | field        | value           |
    | Name         | Example User    |
    | Email        | userexample.com |
  And I click the button "Create my account"
  Then I should see a warning

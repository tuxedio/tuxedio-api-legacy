Feature: Vendor sign in
  As a Vendor
  So that I can to create an account
  I want to sign up using the register page

Scenario:
  Given I visit the vendor sign up page
  When I fill in the following:
  | field        | value              |
  | Name         | Example Vendor     |
  | Email        | vendor@example.com |
  | Zip          | 80301              |
  | Password     | foobarfoobar       |
  | Confirmation | foobarfoobar       |
  And I click the button "Create my account"
  Then I should recieve an email to "vendor@example.com"

Scenario:
  Given I visit the vendor sign up page
  When I fill in the following:
  | field        | value              |
  | Name         | Example Vendor     |
  | Email        | vendor@example.com |
  | Zip          |                    |
  | Password     |                    |
  | Confirmation | foobarfoobar       |
  And I click the button "Create my account"
  And I should see a warning message

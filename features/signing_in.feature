Feature: Signing in
  # As a registered user
  # So I can view my account
  # I want to sign in using the log-in page

  Scenario: Unsuccessful signin
    Given a user visits the signin page
    When they submit invalid signin information
    Then they should see an error message

  Scenario: Successful signin
    Given a user visits the signin page
    And the user has an account
    When the user submits valid signin information
    Then they should see their profile page
    And they should see a signout link
    When the user clicks the signout link
    Then they should see a signin link



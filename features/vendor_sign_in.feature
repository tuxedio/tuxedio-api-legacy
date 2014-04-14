Feature: Signing in

  Scenario: Unsuccessful signin
    Given a vendor visits the signin page
    When they submit invalid signin information
    Then they should see an error message

  Scenario: Successful signin
    Given a vendor visits the signin page
    And the vendor has an account
    When the vendor submits valid signin information
    Then they should see their profile page
    And they should see a signout link
    When the vendor clicks the signout link
    Then they should see the home page

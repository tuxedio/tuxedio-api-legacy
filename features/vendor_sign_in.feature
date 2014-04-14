Feature: Vendor signing in

  Scenario: Unsuccessful signin
    Given a vendor visits the signin page
    When the vendor submits invalid signin information
    Then the vendor should see an error message

  Scenario: Successful signin
    Given a vendor visits the signin page
    And the vendor has an account
    When the vendor submits valid signin information
    Then the vendor should see their profile page
    And the vendor should see a signout link
    When the vendor clicks the signout link
    Then the vendor should see the home page

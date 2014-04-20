Feature: Vendor signing in, first time

  Scenario: Unsuccessful signin
    Given a vendor visits the signin page
    When the vendor submits invalid signin information
    Then the vendor should see an error message

  Scenario: Successful signin
    Given a vendor visits the signin page
    And the vendor has an account, yet hasn't logged in
    When the vendor submits valid signin information
    Then the vendor should see the confirm details page

  Scenario: Confirms yelp info
    Given a vendor visits the signin page
    And the vendor has an account, yet hasn't logged in
    When the vendor submits valid signin information
    Then the vendor should see the confirm details page
    When the vendor clicks the "Yes" link
    Then the vendors information should be updated

  Scenario: Doesn't confirm yelp info
    Given a vendor visits the signin page
    And the vendor has an account, yet hasn't logged in
    When the vendor submits valid signin information
    Then the vendor should see the confirm details page
    When the vendor clicks the "No" link
    Then the vendors information should not be updated


Feature: Signing in

  Scenario: Unsuccessful signin
    Given a customer visits the signin page
    When the customer submits invalid signin information
    Then the customer should see an error message

  Scenario: Successful signin
    Given a customer visits the signin page
    And the customer has an account
    When the customer submits valid signin information
    Then the customer should see their profile page
    And the customer should see a signout link
    When the customer clicks the signout link
    Then the customer should see the home page

  Scenario: Valid Dropdown signin
    Given a customer visits the home page
    And the customer has an account
    When the customer submits valid signin information
    Then the customer should see their profile page
    And the customer should see a signout link
    When the customer clicks the signout link
    Then the customer should see the home page

  Scenario: Invalid Dropdown signin
    Given a customer visits the home page
    When the customer submits invalid signin information
    Then the customer should see an error message





Feature: Vendor signing in, first time

  Scenario: Confirms yelp info
    Given a boulder_vendor exists
    When I sign in as that user
    Then I should be on the confirm details vendors page
    When I click the button "Update"
    Then I should see a success message
    And I should be on the vendor profile page

  Scenario: Yelp gives an invalid location
    Given a vendor_with_invalid_city exists
    When I sign in as that user
    Then I should be on the confirm details vendors page
    When I click the button "Update"
    Then I should see a warning message

  Scenario: Invalid Yelp info
    Given a vendor_with_strange_name exists
    When I sign in as that user
    Then I should be on the vendor profile page
    And I should see the text "hfgjfsfdtgdf"

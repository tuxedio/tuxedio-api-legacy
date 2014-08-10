Feature: Vendor signing in, first time

  Scenario: Confirms yelp info
    Given I am signed in as a boulder_vendor
    Then I should be on the confirm details vendors page
    When I click the button "Update"
    Then I should see a success message
    And I should be on the vendor profile page

  Scenario: Yelp gives an invalid location
    Given I am signed in as a vendor
    Then I should be on the confirm details vendors page
    When I click the button "Update"
    Then I should see a warning message

  Scenario: Invalid Yelp info
    Given a vendor_with_strange_name exists
    And that user is confirmed
    When I sign in as that user
    Then I should be on the vendor profile page
    And I should see the text "hfgjfsfdtgdf"

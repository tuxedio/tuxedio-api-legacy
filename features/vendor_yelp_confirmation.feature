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
    Then show me the page
    Then I should see a warning message

  Scenario: Invalid Yelp info
    Given a vendor exists with name: "hfgjfsfdtgdf", zip_code: 11111
    And that vendor is confirmed
    When I sign in as that vendor
    Then I should be on the vendor profile page
    And I should see the text "hfgjfsfdtgdf"



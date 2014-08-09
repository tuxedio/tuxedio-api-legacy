Given(/^a vendor is logged in$/) do
  steps %{
    Given a vendor exists
    And that vendor is confirmed
    Given I visit the new user session page
    When the vendor submits valid signin information
  }
end

When(/^the vendor clicks the "(.*?)" link$/) do |link_name|
  click_link(link_name)
end
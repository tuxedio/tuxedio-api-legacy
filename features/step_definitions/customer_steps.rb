Given(/^a customer is logged in$/) do
  steps %{
    Given a customer visits the signin page
    And the customer has an account
    When the customer submits valid signin information
    Then the customer should see the home page
    Given a customer visits the home page
  }
end

When(/^the customer clicks the "(.*?)" link$/) do |link_name|
  click_link(link_name.to_s)
end

Given(/^a customer is logged out$/) do
  visit root_path
end

Then(/^the customer should see the "(.*?)" link$/) do |link_name|
  page.should have_link(link_name)
end

Then(/^the customer should not see the "(.*?)" link$/) do |link_name|
  page.should_not have_link(link_name)
end

Given(/^a vendor is logged in$/) do
  steps %{
    Given a vendor visits the signin page
    And the vendor has an account
    When the vendor submits valid signin information
    Then the vendor should see their profile page
    Given a vendor visits the home page
  }
end

When(/^the vendor clicks the "(.*?)" link$/) do |link_name|
  click_link(link_name)
end

Given(/^a vendor is logged out$/) do
  visit root_path
end

Then(/^the vendor should should see the "(.*?)" link$/) do |link_name|
  page.should have_link(link_name)
end

Then(/^the vendor should not see the "(.*?)" link$/) do |link_name|
  page.should_not have_link(link_name)
end

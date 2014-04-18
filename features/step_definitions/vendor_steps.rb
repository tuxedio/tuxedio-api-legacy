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

Then(/^the vendor should see the "(.*?)" link$/) do |link_name|
  page.should have_link(link_name)
end

Then(/^the vendor should not see the "(.*?)" link$/) do |link_name|
  page.should_not have_link(link_name)
end

Then(/^the vendor should see their profile picture$/) do
  expect(page).to have_selector('.vendor-picture')
end

Then(/^the vendor should see their name$/) do
  expect(find('.vendor-name')).to have_content(@vendor.name)
end

Then(/^the vendor should see their location$/) do
  expect(find('.vendor-location')).to have_content(@vendor.location)
end

When(/^then vendor has activities$/) do
  @activity1 = @vendor.activities.create(name:"Activity", location: "Location", description:"description", price:"100.00")
  visit vendor_profile_path
end

Then(/^the vendor should see their offered activities$/) do
  expect(find('.activity-list')).to have_content(@activity1.name)
end

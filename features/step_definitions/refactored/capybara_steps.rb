#################################
# Generic Steps
#################################

# ----------------------
# Debug

# For loading debugger
Given /debugger/ do
  debugger
end

# Using Launchy to open the page
Then /^show me the page$/ do
  save_and_open_page
end

# ----------------------
# Visits

Given /^I visit (.*?)$/ do |page|
  visit path_to(page)
end


#-----------------------
# Forms

When /^I fill in the following:?$/ do |table|
  table.hashes.each do |hash|
    fill_in hash['field'], with: hash['value']
  end
end

When(/^I click the button "(.*?)"$/) do |button|
  click_button button
end


#-----------------------
# Navigation

When(/^I click the link "(.*?)"$/) do |link|
  click_link link
end

Then(/^I should be on (.*?)$/) do |page|
  expect(current_path).to eq(path_to(page))
end

Then(/^I should see an? (.*?) message$/) do |message|
  selector = "div.alert.alert-#{message}"
  expect(page).to have_selector(selector)
end

Then(/^I should( not)? see the "(.*?)" link$/) do |should_not, link|
  if (should_not)
    page.should_not have_link(link)
  else
    page.should have_link(link)
  end
end


#-----------------------
# Action Mailer


Then(/^I should recieve an email to "(.*?)"$/) do |email|
  mail = ActionMailer::Base.deliveries.last
  mail.to.should include(email)
end

#----------------------

Given(/^a customer is logged in$/) do
  steps %{
    Given a customer visits the signin page
    And the customer has an account
    When the customer submits valid signin information
    Then the customer should see the "/explore" page
    Given a customer visits the home page
  }
end



Given(/^a customer is logged out$/) do
  visit root_path
end

#################################
# Customer Specific Steps
#################################

# ----------------------
# Visits
Given /^a customer visits the home page$/ do
  visit path_to("the home page")
end

Given(/^a customer visits the sign up page$/) do
  visit new_customer_registration_path
end

#-----------------------
# Should see
Then /^the customer should see a signout link$/ do
  expect(page).to have_link('Sign out', href: destroy_customer_session_path)
end

Then /^the customer should see their profile page$/ do
  expect(page).to have_title("tuxedio | " + @customer.name)
end

Then /^the customer should see the home page$/ do
  expect(page).to have_title('tuxedio | Home')
end

Then(/^the customer should see the "(.*?)" link$/) do |link_name|
  page.should have_link(link_name)
end

Then(/^the customer should not see the "(.*?)" link$/) do |link_name|
  page.should_not have_link(link_name)
end


#-----------------------
# Clicks

When(/^the customer clicks the signout link$/) do
  click_link "Sign out"
end

When(/^the customer clicks the "(.*?)" link$/) do |link_name|
  click_link(link_name.to_s)
end

#-----------------------
#


#################################
# Vendor Specific Steps
#################################
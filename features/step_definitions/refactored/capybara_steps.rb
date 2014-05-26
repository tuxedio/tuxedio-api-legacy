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

When(/^(?:|I )check "(.*?)" field$/) do |field|
  check(field)
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

Then(/^I should( not)? see the text "(.*?)"$/) do |should_not, text|
  if (should_not)
    page.should_not have_content(text)
  else
    page.should have_content(text)
  end
end

#-----------------------
# Action Mailer


Then(/^I should recieve an email to "(.*?)"$/) do |email|
  mail = ActionMailer::Base.deliveries.last
  mail.to.should include(email)
end



# #################################
# # Customer Specific Steps
# #################################


When(/^the customer clicks the "(.*?)" link$/) do |link_name|
  click_link(link_name.to_s)
end

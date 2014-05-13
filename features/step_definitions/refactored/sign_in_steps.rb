######################################
# CUSTOMER SIGN IN
######################################

Given(/^I am signed in as a customer$/) do
  steps %q{
    Given a customer exists
    And that customer is confirmed
    And I visit the new customer session page
    When I fill in the following:
    | field    | value                |
    | Email    | customer@example.com |
    | Password | foobar1234           |
    And I click the button "Sign in"
  }
end


Given(/^(.+) is confirmed$/) do |user|
  model(user).confirm!
end


Given /^a customer visits the signin page$/ do
  visit new_customer_session_path
end

#--------------------------
# Invalid Customer Sign-in

When /^the customer submits invalid signin information$/ do
  click_button "Sign in"
end

Then /^the customer should see an error message$/ do
  expect(page).to have_selector('div.alert.alert-warning')
end


#--------------------------
# Valid Customer Sign-in

Given /^the customer has an account$/ do
  #creates a Customer
  @customer = Customer.create(name: "Example User", email: "user@example.com", password: "foobar",password_confirmation: "foobar", location: "Boulder")
  @customer.confirm!
end

When /^the customer submits valid signin information$/ do
  fill_in "customer_email",    with: @customer.email
  fill_in "Password", with: @customer.password
  click_button "Sign in"
end


######################################
# VENDOR SIGN IN
######################################




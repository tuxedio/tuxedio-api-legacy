######################################
# CUSTOMER SIGN IN
######################################

Given(/^I am signed in as a customer$/) do
  steps %q{
    Given a customer exists
    And that customer is confirmed
    And I sign in as that customer
  }
end

Given(/^(.+) is confirmed$/) do |user|
  model(user).confirm!
end

Given(/^I sign out as a customer$/) do
  page.driver.submit :delete, "/customers/sign_out", {}
end





#--------------------------
# Valid Customer Sign-in

Given /^a customer visits the signin page$/ do
  visit new_customer_session_path
end

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




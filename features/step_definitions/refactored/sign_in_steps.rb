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

Given(/^I sign in as (.*?)$/) do |user|
  @customer = model(user)
  @customer.confirm!
  visit new_customer_session_path
  fill_in "Email",        with: @customer.email
  fill_in "Password",     with: "foobar1234"
  click_button "Sign in"
end

Given(/^that customer signs in$/) do
  visit new_customer_session_path
  fill_in "Email",        with: @customer.email
  fill_in "Password",     with: @customer.password
  click_button "Sign in"
end


######################################
# VENDOR SIGN IN
######################################

Given(/^I am signed in as a vendor$/) do
  steps %q{
    Given a vendor exists
    And that vendor is confirmed
    And I sign in as that vendor
  }
end



######################################
# Generic Steps
######################################

Given(/^(.+) is confirmed$/) do |user|
  model(user).confirm!
end

Given(/^I sign out as a (.*?)$/) do |user|
  page.driver.submit :delete, "/#{user}s/sign_out", {}
end
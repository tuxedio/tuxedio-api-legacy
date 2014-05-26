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
  @user = model(user)
  if @user.nil?
    @user = find_model(user)
  end
  @user.confirm!
  if @user.class.name == "Customer"
    visit new_customer_session_path
  elsif @user.class.name == "Vendor"
    visit new_vendor_session_path
  end
    fill_in "Email",        with: @user.email
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
Given(/^I am signed in as a boulder_vendor$/) do
  steps %q{
    Given a boulder_vendor exists
    And that boulder_vendor is confirmed
    And I sign in as that boulder_vendor
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
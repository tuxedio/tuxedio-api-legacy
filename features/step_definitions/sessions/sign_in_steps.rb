######################################
# CUSTOMER SIGN IN
######################################

Given(/^I am signed in as a person$/) do
  steps %q{
    Given a person exists
    And that person is confirmed
    And I sign in as that person
  }
end

Given(/^I sign in as (.*?)$/) do |user|
  @user = model(user)
  if @user.nil?
    @user = find_model(user)
  end
  @user.confirm!
  if @user.class.name == "Person"
    visit new_person_session_path
  elsif @user.class.name == "Vendor"
    visit new_vendor_session_path
  end
    fill_in "Email",        with: @user.email
    fill_in "Password",     with: "foobar1234"
    click_button "Sign in"
end

Given(/^that person signs in$/) do
  visit new_person_session_path
  fill_in "Email",        with: @person.email
  fill_in "Password",     with: @person.password
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
  page.driver.submit :delete, "/#{user.pluralize}/sign_out", {}
end

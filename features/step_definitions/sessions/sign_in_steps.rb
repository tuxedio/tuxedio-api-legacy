######################################
# CUSTOMER SIGN IN
######################################

Given(/^I am signed in as a person$/) do
  steps %q{
    Given a person exists with email: "bob@example.com"
    And that person is confirmed
    And I sign in as that user
  }
end

Given(/^I sign in as that user$/) do
  if @user.nil?
    @user = User.last
  end
  if !@user.confirmed?
    @user.confirm!
  end
  visit new_user_session_path
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
    And I sign in as that user
  }
end
Given(/^I am signed in as a boulder_vendor$/) do
  steps %q{
    Given a boulder_vendor exists
    And that boulder_vendor is confirmed
    And I sign in as that user
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

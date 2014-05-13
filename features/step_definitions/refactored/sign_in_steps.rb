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


######################################
# VENDOR SIGN IN
######################################




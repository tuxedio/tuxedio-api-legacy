Given /^a customer visits the signin page$/ do
  visit new_customer_session_path
end

Given /^a customer visits the home page$/ do
  visit root_path
end

When /^they submit invalid signin information$/ do
  click_button "Sign in"
end

Then /^they should see an error message$/ do
  expect(page).to have_selector('div.alert.alert-alert')
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

Then /^they should see their profile page$/ do
  expect(page).to have_title("Tuxedo | " + @customer.name)
end

Then /^they should see a signout link$/ do
  expect(page).to have_link('Sign out', href: destroy_customer_session_path)
end

When(/^the customer clicks the signout link$/) do
  click_link "Sign out"
end

Then /^they should see the home page$/ do
  expect(page).to have_title('Tuxedo | Home')
end

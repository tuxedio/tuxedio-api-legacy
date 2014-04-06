Given /^a user visits the signin page$/ do
  visit signin_path
end

When /^they submit invalid signin information$/ do
  click_button "Sign in"
end

Then /^they should see an error message$/ do
  expect(page).to have_selector('div.alert.alert-error')
end

Given /^the user has an account$/ do
  #creates a Customer
  @customer = User.create(name: "Example User", email: "user@example.com", password: "foobar",password_confirmation: "foobar", location: "Boulder", customer: true, vendor: false, blogger: false)
end

When /^the user submits valid signin information$/ do
  fill_in "Email",    with: @customer.email
  fill_in "Password", with: @customer.password
  click_button "Sign in"
end

Then /^they should see their profile page$/ do
  expect(page).to have_title("Tuxedio | " + @customer.name)
end

Then /^they should see a signout link$/ do
  expect(page).to have_link('Sign out', href: signout_path)
end

When(/^the user clicks the signout link$/) do
  click_link "Sign out"
end

Then /^they should see a signin link$/ do
  expect(page).to have_link('Sign in', href: signin_path)
end

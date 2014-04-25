SimpleCov.command_name 'CUCUMBER TESTING'
Given /^a vendor visits the signin page$/ do
  visit new_vendor_session_path
end

Given /^a vendor visits the home page$/ do
  visit root_path
end

When /^the vendor submits invalid signin information$/ do
  click_button "Sign in"
end

Then /^the vendor should see an error message$/ do
  expect(page).to have_selector('div.alert.alert-warning')
end

Given /^the vendor has an account$/ do
  #creates a Vendor
  @vendor = Vendor.create!(name: "My Own Example Vendor", email: "vendor123454321@example.com", password: "mypassword",password_confirmation: "mypassword", location: "Broomfield", zip_code: 80301)
  @vendor.update confirmed: true
  @vendor.confirm!
end

When /^the vendor submits valid signin information$/ do
  fill_in "vendor_email",    with: @vendor.email
  fill_in "Password", with: @vendor.password
  click_button "Sign in"
end

Then /^the vendor should see confirm details page$/ do
  expect(page).to have_title("Tuxedo | Confirm details")
end

Then /^the vendor should see their profile page$/ do
  expect(page).to have_title("Tuxedo | " + @vendor.name)
end

Then /^the vendor should see a signout link$/ do
  expect(page).to have_link('Sign out', href: destroy_vendor_session_path)
end

When(/^the vendor clicks the signout link$/) do
  click_link "Sign out"
end

Then /^the vendor should see the home page$/ do
  expect(page).to have_title('Tuxedo | Home')
end


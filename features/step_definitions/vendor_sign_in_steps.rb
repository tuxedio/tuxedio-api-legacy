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
  expect(page).to have_selector('div.alert.alert-alert')
end

Given /^the vendor has an account$/ do
  #creates a Vendor
  @vendor = Vendor.create(name: "Example User", email: "vendor@example.com", password: "foobar",password_confirmation: "foobar", location: "Broomfield")
  @vendor.confirm!
end

When /^the vendor submits valid signin information$/ do
  fill_in "vendor_email",    with: @vendor.email
  fill_in "Password", with: @vendor.password
  click_button "Sign in"
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

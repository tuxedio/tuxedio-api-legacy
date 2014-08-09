SimpleCov.command_name 'CUCUMBER TESTING'
Given /^a vendor visits the signin page$/ do
  visit new_vendor_session_path
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
  fill_in "Email",    with: User.last.email
  fill_in "Password", with: "foobar1234"
  click_button "Sign in"
end

Then /^the vendor should see their profile page$/ do
  expect(page).to have_title("tuxedio | " + @vendor.name)
end


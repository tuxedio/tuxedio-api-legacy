SimpleCov.command_name 'CUCUMBER TESTING'

Given /^the vendor has an account, yet hasn't logged in$/ do
  #creates a Vendor
  @vendor = Vendor.create!(name: "Example User", email: "vendor@example.com", password: "mypassword",password_confirmation: "mypassword", location: "Broomfield", zip_code: 80301, confirmed: false)
  @vendor.confirm!
end

Given /^the vendor has an invalid Yelp information, yet hasn't logged in$/ do
  #creates a Vendor
  @vendor = Vendor.create!(name: "hfgjfsfdtgdf", email: "vendor@example.com", password: "mypassword",password_confirmation: "mypassword", location: "Broomfield", zip_code: 11111, confirmed: false)
  @vendor.confirm!
end

Then /^the vendor should see the confirm details page$/ do
  expect(page).to have_title("tuxedio | Confirm details")
end

Then /^the vendor should(.*?) see success message$/ do |u|
  if u == " not"
	  expect(page).to_not have_selector('div.alert.alert-success')
  else
    expect(page).to have_selector('div.alert.alert-success')
  end
end

Given(/^a vendor visits the sign up page$/) do
  visit new_vendor_registration_path
end

When(/^the vendor submits (in)*valid signup information$/) do |invalid|
  if (invalid)
    fill_in "Name",         with: "My Example Vendor"
    fill_in "Email",        with: "Vendorexample.com"
    page.select "Boulder",  from: "Location"
    fill_in "Zip code",     with: "803011"
    fill_in "Password",     with: "foobafoobar"
    fill_in "Confirmation", with: "foobarfoobar"
    click_button "Create my account"
  else
    fill_in "Name",         with: "My Example Vendor"
    fill_in "Email",        with: "user12345@example.com"
    page.select "Boulder",  from: "Location"
    fill_in "Zip code",     with: "80301"
    fill_in "Password",     with: "foobarfoobar"
    fill_in "Confirmation", with: "foobarfoobar"
    click_button "Create my account"
  end
end

Then(/^the vendor should see email confirmation notice$/) do
  expect(page).to have_content("A message with a confirmation link has been sent to your email address. Please open the link to activate your account.")
end

Then(/^vendor should be redirected to the the sign up page$/) do
  expect(page).to have_title("Tuxedo | Sign up")
end

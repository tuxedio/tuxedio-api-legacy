Given(/^a (.*?) visits the sign up page$/) do |user|
  visit new_customer_registration_path
end

When(/^the customer submits (in)*valid signup information$/) do |invalid|
  if (invalid)
    fill_in "Name",         with: "Example User"
    fill_in "Email",        with: "userexample.com"
    fill_in "Location",     with: "Boulder"
    fill_in "Password",     with: "foobafoobar"
    fill_in "Confirmation", with: "foobarfoobar"
    click_button "Create my account"
  else
    fill_in "Name",         with: "Example User"
    fill_in "Email",        with: "user@example.com"
    fill_in "Location",     with: "Boulder"
    fill_in "Password",     with: "foobarfoobar"
    fill_in "Confirmation", with: "foobarfoobar"
    click_button "Create my account"
  end
end

Then(/^they should see email confirmation notice$/) do
  #expect(page).to have_selector('div.alert.alert-alert')
  expect(page).to have_content("A message with a confirmation link has been sent to your email address. Please open the link to activate your account.")
end

Then(/^they should be redirected to the the sign up page$/) do
  expect(page).to have_title("Sign up")
end

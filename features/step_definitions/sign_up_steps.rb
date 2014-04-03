Given(/^a (.*?) visits the sign up page$/) do |user|
  visit signup_path
end

When(/^the user submits (in)*valid signup information$/) do |invalid|
  if (invalid)
    fill_in "Name",         with: "Example User"
    fill_in "Email",        with: "userexample.com"
    fill_in "Location",     with: "Boulder"
    fill_in "Password",     with: "foobar"
    fill_in "Confirmation", with: "foobar"
    click_button "Create my account"
  else
    fill_in "Name",         with: "Example User"
    fill_in "Email",        with: "user@example.com"
    fill_in "Location",     with: "Boulder"
    fill_in "Password",     with: "foobar"
    fill_in "Confirmation", with: "foobar"
    click_button "Create my account"
  end
end

Then(/^they should be redirected to their profile page\.$/) do
  expect(page).to have_content("Example User")
end

Then(/^they should be redirected to the the sign up page$/) do
  expect(page).to have_title("Sign up")
end

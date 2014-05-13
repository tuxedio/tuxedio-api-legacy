When(/^I sign up as a customer with an image$/) do
  fill_in "Name",         with: "Example User"
  fill_in "Email",        with: "user@example.com"
  fill_in "Location",     with: "Boulder"
  attach_file "Picture", File.join(Rails.root, 'features', 'upload_files', "my_avatar.jpg")
  fill_in "Password",     with: "foobar1234"
  fill_in "Confirmation", with: "foobar1234"
  click_button "Create my account"
  @customer = Customer.find_by_email("user@example.com")
  @customer.password = "foobar1234"
  @customer.confirm!
end

Given(/^that customer signs in$/) do
  visit new_customer_session_path
  fill_in "Email",        with: @customer.email
  fill_in "Password",     with: @customer.password
  click_button "Sign in"
end

Then(/^I should see my profile picture$/) do
  img_src = @customer.picture.url(:medium)
  page.should have_xpath("//img[@src='#{img_src}']")
end

Given(/^I sign in as (.*?)$/) do |user|
  @customer = model(user)
  @customer.confirm!
  visit new_customer_session_path
  fill_in "Email",        with: @customer.email
  fill_in "Password",     with: "foobar1234"
  click_button "Sign in"
end

Then(/^I should see the default image$/) do
  page.should have_xpath("//img[@src=\"/assets/missing_avatar.jpg\"]")
end

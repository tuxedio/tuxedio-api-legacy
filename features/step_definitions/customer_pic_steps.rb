Given(/^a customer has signed up with a profile picture$/) do
  steps %{
    Given a customer visits the sign up page
    When the customer submits an image
  }
  @customer = @customer = Customer.find_by_email("user@example.com")
  @customer.confirm!
end

When(/^the customer submits an image$/) do
  fill_in "Name",         with: "Example User"
  fill_in "Email",        with: "user@example.com"
  fill_in "Location",     with: "Boulder"
  attach_file "Picture", File.join(Rails.root, 'features', 'upload_files', "my_avatar.jpg")
  fill_in "Password",     with: "foobarfoobar"
  fill_in "Confirmation", with: "foobarfoobar"
  click_button "Create my account"
end

Given(/^the customer with profile picture signs in$/) do
  visit new_customer_session_path
  fill_in "Email",        with: "user@example.com"
  fill_in "Password",     with: "foobarfoobar"
  click_button "Sign in"
end

Then(/^the customer should see their profile picture$/) do
  img_src = @customer.picture.url
  page.should have_xpath("//img[@alt=\"My avatar\"]")
end

Given(/^the customer has not chosen a profile picture$/) do
  @customer = Customer.create(name: "Example User", email: "customer@example.com", password: "foobar",password_confirmation: "foobar", location: "Boulder", picture: "")
  @customer.confirm!
end

Then(/^the customer should see the default image for their profile picture$/) do
  page.should have_xpath("//img[@src=\"/assets/missing_avatar.jpg\"]")
end

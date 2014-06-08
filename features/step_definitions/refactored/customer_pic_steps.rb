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

Then(/^I should see my profile picture$/) do
  img_src = @customer.picture.url(:medium)
  page.should have_xpath("//img[@src='#{img_src}']")
end

Then(/^I should see the default image$/) do
  page.should have_xpath("//img[@src=\"/assets/missing_avatar.jpg\"]")
end

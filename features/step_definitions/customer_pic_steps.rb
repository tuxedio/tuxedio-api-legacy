Given(/^the customer has chosen a profile picture$/) do
  @customer = Customer.create(name: "Example User", email: "customer@example.com", password: "foobar",password_confirmation: "foobar", location: "Boulder", picture: "fishshapes.jpg")
  @customer.confirm!
end

Then(/^the customer should see their profile picture$/) do
  page.should have_xpath("//img[@alt]")
end

Given(/^the customer has not chosen a profile picture$/) do
  @customer = Customer.create(name: "Example User", email: "customer@example.com", password: "foobar",password_confirmation: "foobar", location: "Boulder", picture: "")
  @customer.confirm!
end

Then(/^the customer should see the default image for their profile picture$/) do
  page.should have_xpath("//img[@src=\"/assets/missing_avatar.jpg\"]")
end

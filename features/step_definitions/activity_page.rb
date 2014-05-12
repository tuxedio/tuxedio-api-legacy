When(/^the customer clicks an image$/) do
	click_link(1)
end

Then(/^the customer should see the activity's page$/) do
  expect(page).to have_content('Vendor information')
  expect(page).to have_link('Add to trip')
end

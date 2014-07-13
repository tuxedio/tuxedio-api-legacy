When(/^the person clicks an image$/) do
	click_link(1)
end

Then(/^the person should see the activity's page$/) do
  expect(page).to have_content('Vendor information')
  expect(page).to have_link('Add to adventure')
end

Then(/^the customer should see activities displayed$/) do
  expect(page).to have_selector('div.well.explore-activity')
end


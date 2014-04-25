Then(/^the customer should see activities displayed$/) do
  expect(page).to have_selector('div.well.explore-activity')
end

When(/^the customer clicks an Add to trip link$/) do
  first(:link, 'Add to trip').click
end

Then(/^they should see the "(.*?)" page$/) do |title|
  expect(page).to have_title("Tuxedo | " + title)
end

Then(/^the customer should see their item in intinerary cart$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the customer clicks the "(.*?)" button$/) do |button|
  click_button button
end


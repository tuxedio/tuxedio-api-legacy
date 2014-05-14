Then(/^the customer should see activities displayed$/) do
  expect(page).to have_selector('div.well.explore-activity')
end

When(/^the customer clicks an Add to trip link$/) do
  first(:link, 'Add to trip').click
end

Then(/^they should see the "(.*?)" page$/) do |title|
  expect(page).to have_title("tuxedio | " + title)
end

Then(/^the customer should see their item in intinerary cart$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the customer clicks the "(.*?)" button$/) do |button|
  click_button button
end

Given(/^the customer has a trip$/) do
  @customer.trips.create!(trip_name: "My Trip", location: "Boulder", start_date: Time.now, number_of_days: 2)
end

Given(/^the customer selects trip and activity time$/) do
  select 'My Trip',   from: '_trip_id'
  find("option[value='3']").click
end

Then(/^they should see "(.*?)" flash$/) do |flizzash|
  expect(page).to have_selector('div.alert.alert-' + flizzash)
end

Then(/^the intinerary cart should(.*?) be empty$/) do |i|
		if i == " not"
    expect(page).to_not have_content('Your trip is empty!')
  else
    expect(page).to have_content('Your trip is empty!')
  end
end




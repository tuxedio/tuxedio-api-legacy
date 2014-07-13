Then(/^the customer should see activities displayed$/) do
  expect(page).to have_selector('div.well.explore-activity')
end

When(/^the customer clicks an Add to adventure link$/) do
  first(:link, 'Add to adventure').click
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

Given(/^the customer has a adventure$/) do
  @customer.adventures.create!(name: "My Adventure", location: "Boulder", start_date: Time.now, number_of_days: 2)
end

Given(/^the customer selects adventure and activity time$/) do
  select 'My Adventure',   from: '_adventure'
  find("option[value='3']").click
end

Then(/^they should see "(.*?)" flash$/) do |flizzash|
  expect(page).to have_selector('div.alert.alert-' + flizzash)
end

Then(/^the intinerary cart should(.*?) be empty$/) do |i|
		if i == " not"
    expect(page).to_not have_content('Your adventure is empty!')
  else
    expect(page).to have_content('Your adventure is empty!')
  end
end




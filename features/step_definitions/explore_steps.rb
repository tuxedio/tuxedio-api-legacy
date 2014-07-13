Then(/^the person should see activities displayed$/) do
  expect(page).to have_selector('div.well.explore-activity')
end

When(/^the person clicks an Add to adventure link$/) do
  first(:link, 'Add to adventure').click
end

Then(/^they should see the "(.*?)" page$/) do |title|
  expect(page).to have_title("tuxedio | " + title)
end

Then(/^the person should see their item in intinerary cart$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the person clicks the "(.*?)" button$/) do |button|
  click_button button
end

Given(/^the person has a adventure$/) do
  @person.adventures.create!(name: "My Adventure", location: "Boulder", start_date: Time.now, number_of_days: 2)
end

Given(/^the person selects adventure and activity time$/) do
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




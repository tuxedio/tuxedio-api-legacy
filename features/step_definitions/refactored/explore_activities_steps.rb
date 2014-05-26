Given(/^I have created a trip$/) do
  @trip = @user.trips.create!(trip_name: "My Trip", location: "Boulder", start_date: Time.now, number_of_days: 2)
end

Given(/^I have no trips$/) do
  Trip.delete_all
end


Then(/^I should see activities displayed$/) do
  expect(page).to have_selector('.explore-activity')
end

Given(/^I select a trip and activity time$/) do
  select 'My Trip',   from: '_trip_id'
  find("option[value='3']").click
end

Then(/^My intinerary cart should(.*?) be empty$/) do |i|
    if i == " not"
    expect(page).to_not have_content('Your trip is empty!')
  else
    expect(page).to have_content('Your trip is empty!')
  end
end
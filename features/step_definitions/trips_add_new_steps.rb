Then(/^the customer should see the "(.*?)" page$/) do |path|
  expect(current_path).to eq(path)
end

When(/^the customer submits (in)*valid trip information$/) do|invalid|
  if (invalid)
    fill_in "trip_trip_name",         with: " "
    fill_in "trip_number_of_days",    with: "asdf"
    click_button "Create trip"
  else
    fill_in "trip_trip_name",         with: "Trip Name"
    select "Boulder",                 from: "trip_location"
    fill_in "trip_number_of_days",    with: 1
    click_button "Create trip"
  end
end
When(/^the customer submits valid trip information for the second time$/) do
  fill_in "trip_trip_name",         with: "Trip Name 2"
  select "Boulder",                 from: "trip_location"
  fill_in "trip_number_of_days",    with: 1
  click_button "Create trip"
end

Then(/^the trip name should be present$/) do
  expect(page).to have_content("Trip Name")
end

Then(/^both trip names should be present$/) do
  expect(page).to (have_content("Trip Name") && have_content("Trip Name 2"))
end

Then(/^they should see warnings$/) do
  expect(page).to have_selector('.alert.alert-warning')
end

Given(/^a customer visits the "(.*?)" page$/) do |path|
  visit path
end
When(/^the customer visits the "(.*?)" page$/) do |path|
  visit path
end
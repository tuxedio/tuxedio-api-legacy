When(/^the customer selects an activity to add$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^the customer submits (in)*valid itinerary item information$/) do |invalid|
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

Then(/^the customer should see a success flash$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^the customer submits invalid itinerary item information$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the customer should see a warning$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^a customer clicks the "(.*?)" link$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
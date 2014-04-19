Then(/^the vendor should see the "Add an activity" page$/) do
  expect(current_path).to eq(new_vendors_activities_path)
end

Given(/^the vendor visits the "Add an activity" page$/) do
  visit new_vendors_activities_path
end

When(/^the vendor submits (in)*valid activity information$/) do |invalid|
  if (invalid)
    fill_in "Location",     with: "Location"
    fill_in "Description",  with: "New Description"
    fill_in "Price",        with: "asdf"
    click_button "Create activity"
  else
    fill_in "Name",         with: "Example Activity"
    fill_in "Location",     with: "Location"
    fill_in "Description",  with: "New Description"
    fill_in "Price",        with: 12.00
    click_button "Create activity"
  end
end

Then(/^the vendor should see their new activity$/) do
  expect(find('.activity-list')).to have_content("Example Activity")
end

When(/^a user visits the "Add an activity" page$/) do
  visit new_vendors_activities_path
end

Then(/^they should see the vendor sign in page$/) do
  expect(current_path).to eq(new_vendor_session_path)
end
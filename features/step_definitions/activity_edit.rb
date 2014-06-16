Given(/^a vendor has an activity$/) do
  Vendor.find(1).activities.create(name: "Activity1", description: "Description", location: "Boulder", price: 10 )
end

Then(/^the vendor should see the edit activity page$/) do
  expect(current_path).to eq(edit_vendors_activities_path)
end

When(/^the vendor makes a (in)*valid change to activity information$/) do |invalid|
  if invalid
    fill_in "Name",  with: ""
    click_button "Save activity"
  else
    fill_in "Name",  with: "Changed Activity"
    click_button "Save activity"
  end
end

Then(/^the vendor should see their changed activity$/) do
  expect(find('.activity-list')).to have_content("Changed Activity")
end

When(/^the vendor visits the edit an activity page$/) do
  visit edit_vendors_activities_path
end

Then(/^the vendor should redirect to the edit an activity page$/) do
  expect(current_path).to eq(vendors_activities_path + ".1")
end
Then(/^the vendor should see the "(.*?)" page$/) do |p|
  expect(page).to have_title("tuxedio | " + p)
end

Then(/^the vendor should redirect to the "Add an experience" page$/) do
  expect(current_path).to eq(vendors_experiences_path)
end

Given(/^the vendor visits the "Add an experience" page$/) do
  visit new_vendors_experiences_path
end

When(/^the vendor submits (in)*valid experience information$/) do |invalid|
  if (invalid)
    fill_in "Location",     with: "Location"
    fill_in "Description",  with: "New Description"
    fill_in "Price",        with: "asdf"
    click_button "Create experience"
  else
    fill_in "Name",         with: "Example Experience"
    fill_in "Location",     with: "Boulder"
    fill_in "Description",  with: "New Description"
    fill_in "Price",        with: 12.00
    click_button "Create experience"
  end
end

Then(/^the vendor should see their new experience$/) do
  expect(find('.experience-list')).to have_content("Example Experience")
end

When(/^a user visits the "Add an experience" page$/) do
  visit new_vendors_experiences_path
end

Then(/^they should see the vendor sign in page$/) do
  expect(current_path).to eq(new_vendor_session_path)
end



Then(/^the vendor should see warnings$/) do
  expect(page).to have_selector('.alert.alert-warning')
end

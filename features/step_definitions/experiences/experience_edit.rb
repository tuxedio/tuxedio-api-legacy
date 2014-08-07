Given(/^a vendor has an experience$/) do
  steps %{
    Given the vendor visits the "Add an experience" page
    When the vendor submits valid experience information
    Then the vendor should see the "Add experience time" page
    Given the vendor submits valid time information
    Then the vendor should see their new experience
  }
end

Then(/^the vendor should see the edit experience page$/) do
  expect(current_path).to eq(edit_vendors_experiences_path)
end

When(/^the vendor makes a (in)*valid change to experience information$/) do |invalid|
  if invalid
    fill_in "Name",  with: ""
    click_button "Save experience"
  else
    fill_in "Name",  with: "Changed Experience"
    click_button "Save experience"
  end
end

Then(/^the vendor should see their changed experience$/) do
  expect(find('.experience-list')).to have_content("Changed Experience")
end

When(/^the vendor visits the edit an experience page$/) do
  visit edit_vendors_experiences_path
end

Then(/^the vendor should redirect to the edit an experience page$/) do
  temp = vendors_experiences_path
  expect(current_path).to match(/[\/vendors\/experiences.].*/)
end
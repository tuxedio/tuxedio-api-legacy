Given(/^I have created a adventure$/) do
  @adventure = @user.rolable.adventures.create!(name: "My Adventure", location: "Boulder", start_date: Time.now, number_of_days: 2)
end

Given(/^I have no adventures$/) do
  Adventure.delete_all
end


Then(/^I should see experiences displayed$/) do
  expect(page).to have_selector('.explore-experience')
end

Given(/^I select a adventure and experience time$/) do
  select 'My Adventure',   from: '_adventure'
  find("option[2]").select_option
end

Then(/^My intinerary cart should(.*?) be empty$/) do |i|
    if i == " not"
    expect(page).to_not have_content('Your adventure is empty!')
  else
    expect(page).to have_content('Your adventure is empty!')
  end
end

Given(/^the vendor submits valid time information$/) do
  select "2018",   from: "activity_time_start_time_1i"
  select "April",  from: "activity_time_start_time_2i"
  select "24",     from: "activity_time_start_time_3i"
  select "18",     from: "activity_time_start_time_4i"
  select "00",     from: "activity_time_start_time_5i"

  select "2018",   from: "activity_time_end_time_1i"
  select "April",  from: "activity_time_end_time_2i"
  select "24",     from: "activity_time_end_time_3i"
  select "19",     from: "activity_time_end_time_4i"
  select "00",     from: "activity_time_end_time_5i"

  click_button "Add time"
end

When(/^the customer clicks an "(.*?)" link$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

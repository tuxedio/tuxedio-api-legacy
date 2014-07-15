
Given(/^the vendor submits (in)*valid time information$/) do |invalid|
  if invalid
    # Start
    select "2012",   from: "experience_time_start_time_1i"
    select "April",  from: "experience_time_start_time_2i"
    select "24",     from: "experience_time_start_time_3i"
    select "18",     from: "experience_time_start_time_4i"
    select "00",     from: "experience_time_start_time_5i"
    #End
    select "2012",   from: "experience_time_end_time_1i"
    select "April",  from: "experience_time_end_time_2i"
    select "24",     from: "experience_time_end_time_3i"
    select "19",     from: "experience_time_end_time_4i"
    select "00",     from: "experience_time_end_time_5i"
  else 
    # Start
    select "2018",   from: "experience_time_start_time_1i"
    select "April",  from: "experience_time_start_time_2i"
    select "24",     from: "experience_time_start_time_3i"
    select "18",     from: "experience_time_start_time_4i"
    select "00",     from: "experience_time_start_time_5i"
    #End
    select "2018",   from: "experience_time_end_time_1i"
    select "April",  from: "experience_time_end_time_2i"
    select "24",     from: "experience_time_end_time_3i"
    select "19",     from: "experience_time_end_time_4i"
    select "00",     from: "experience_time_end_time_5i"
  end
  click_button "Add time"
end

When(/^the person clicks an "(.*?)" link$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

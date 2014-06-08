Given(/^a vendor is logged in$/) do
  steps %{
    Given a vendor visits the signin page
    And the vendor has an account
    When the vendor submits valid signin information
  }
end

When(/^the vendor clicks the "(.*?)" link$/) do |link_name|
  click_link(link_name)
end
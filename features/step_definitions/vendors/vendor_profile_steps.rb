Given(/^a vendor is logged in$/) do
  steps %{
    Given a vendor exists
    And I sign in as that user
  }
end

When(/^the vendor clicks the "(.*?)" link$/) do |link_name|
  click_link(link_name)
end

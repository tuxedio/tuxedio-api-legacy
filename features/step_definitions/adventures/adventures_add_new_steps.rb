Then(/^the person should see the "(.*?)" page$/) do |path|
  expect(current_path).to eq(path)
end

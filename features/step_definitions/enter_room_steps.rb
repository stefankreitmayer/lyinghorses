Before do
  Room.delete_all
end

Given(/^a room named (.+)$/) do |room_name|
  Room.create!(name: room_name)
end

Given(/^I am on the home page$/) do
  visit '/'
end

When(/^I fill in (.+) in the room name field$/) do |text|
  fill_in 'room_name', with: text
end

When(/^I click the button Enter$/) do
  click_button 'Enter'
end

Then(/^I should be in the room named (.+)$/) do |text|
  expect(page).to have_content('You are in room '+text)
end

Then(/^I should see a message (.+)$/) do |message|
  expect(page).to have_content(message)
end

Then(/^I should see a riddle question$/) do
  expect(page).to have_content('What is')
end

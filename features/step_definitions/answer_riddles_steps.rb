require 'riddle/riddle_master'

EXAMPLE_ROOM_NAME = 'ExampleRoomName'

Before do
  Room.delete_all
end

After do
  Room.delete_all
end

Given(/^I see a riddle$/) do
  Room.create!(name: EXAMPLE_ROOM_NAME)
      RiddleMaster.new(EXAMPLE_ROOM_NAME)
  visit '/'
  fill_in 'room_name', with: EXAMPLE_ROOM_NAME
  click_button 'Enter'
end

When(/^I select the correct answer$/) do
  riddle = RiddleMaster.find(EXAMPLE_ROOM_NAME).current_riddle
  click_button riddle.correct_answer
end

When(/^I wait for the round to close$/) do
  pending # express the regexp above with the code you wish you had
end

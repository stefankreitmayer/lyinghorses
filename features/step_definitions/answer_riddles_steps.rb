require 'riddle/riddle_master'

EXAMPLE_ROOM_NAME = 'ExampleRoomName'

def riddle_master
  RiddleMaster.find_or_create(EXAMPLE_ROOM_NAME)
end

def riddle
  riddle_master.current_riddle
end

Before do
  Room.delete_all
end

After do
  Room.delete_all
end

Given(/^I see a riddle$/) do
  Room.create!(name: EXAMPLE_ROOM_NAME)
  visit '/'
  fill_in 'room_name', with: EXAMPLE_ROOM_NAME
  click_button 'Enter'
end

When(/^I select the (.+) answer$/) do |position|
  @selected_answer = riddle.answers.send(position.to_sym)
  click_button @selected_answer
end

Then(/^the (.+) answer should be shown as selected$/) do |position|
  expect(page).to have_content('Your selected answer is: '+@selected_answer)
end

When(/^the correct answer is revealed$/) do
  pending
  # expect(page).to have_content('The correct answer is')
end

Given(/^I selected the correct answer$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^the riddle closes$/) do
  pending # express the regexp above with the code you wish you had
end

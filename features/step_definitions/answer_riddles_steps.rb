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

Given(/^the correct answer is selected$/) do
  click_button riddle.correct_answer
end

Then(/^the (.+) answer should be shown as selected$/) do |position|
  expect(page).to have_content('Your selected answer is: '+
                               riddle.answers.send(position.to_sym))
  expect(page).not_to have_content('Please select an answer')
end

Then(/^nothing should be selected$/) do
  expect(page).to have_content('Please select an answer')
  expect(page).not_to have_content('Your selected answer is:')
end

When(/^the riddle closes$/) do
  pending # express the regexp above with the code you wish you had
end

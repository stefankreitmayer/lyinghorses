require 'riddle/riddle_master'

EXAMPLE_ROOM_NAME = 'ExampleRoomName'

def riddle_master
  RiddleMaster.find_or_create(EXAMPLE_ROOM_NAME)
end

def riddle
  riddle_master.current_riddle
end

def read_score
  element = find('#score')
  string = element.native.text
  string[/\d+/]
end

Before do
  Room.delete_all
end

After do
  Room.delete_all
end

Given(/^I see a riddle question$/) do
  Room.create!(name: EXAMPLE_ROOM_NAME)
  visit '/'
  fill_in 'room_name', with: EXAMPLE_ROOM_NAME
  click_button 'Enter'
end

When(/^I select answer (\d+)$/) do |position|
  @selected_answer = riddle.answers[position.to_i+1]
  click_button @selected_answer
end

Given(/^I select the correct answer$/) do
  click_button riddle.correct_answer
end

Given(/^I select a wrong answer$/) do
  riddle.answers.each do |answer|
    unless answer == riddle.correct_answer
      click_button answer
      break
    end
  end
end

Then(/^answer (\d+) should be shown as selected$/) do |position|
  expect(page).to have_content('Your selected answer is: '+
                               riddle.answers[position.to_i+1])
end

Then(/^no answer should be selected$/) do
  expect(page).to have_content('Please select an answer')
  expect(page).not_to have_content('Your selected answer is')
end

And(/^I wait (\d+) seconds$/) do |n|
  sleep(n.to_i)
end

Given(/^I see my score$/) do
  @initial_score = read_score
end

Then(/^my score should be higher than before$/) do
  expect(read_score).to be > @initial_score
end

Then(/^my score should be the same$/) do
  expect(read_score).to eq @initial_score
end

Then(/^I should see a different riddle question$/) do
  pending # express the regexp above with the code you wish you had
end

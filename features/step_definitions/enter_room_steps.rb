Before do
  Room.delete_all
end

Given(/^a room named ExampleRoom$/) do
  Room.create!(name: 'ExampleRoom')
end

Given(/^I am on the home page$/) do
  visit '/'
end

When(/^I fill in ExampleRoom in the room name field$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I click the link Enter$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be in the room named ExampleRoom$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I fill in DoesNotExist in the room name field$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a message This room does not exist\. Did you spell the name correctly\?$/) do
  pending # express the regexp above with the code you wish you had
end

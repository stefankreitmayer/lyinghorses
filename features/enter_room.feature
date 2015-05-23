Feature: Enter room
  In order to participate in an activity
  As a user
  I want to enter a room

  Scenario: Enter an existing room
    Given a room named ExampleRoom
    And I am on the home page
    When I fill in ExampleRoom in the room name field
    And I click the button Enter
    Then I should be in the room named ExampleRoom
    And I should see a riddle question

  Scenario: Cannot enter nonexistent room
    Given I am on the home page
    When I fill in DoesNotExist in the room name field
    And I click the button Enter
    Then I should see a message This room does not exist. Did you spell the name correctly?

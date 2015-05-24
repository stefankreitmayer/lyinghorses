Feature: Answer riddles
  In order to learn and have fun
  As a user
  I want to answer some riddles

  Scenario: Select correct answer
    Given I see a riddle
    When I select the correct answer
    And I wait for the round to close
    Then I should see a message Correct answer


Feature: Answer riddles
  In order to learn and have fun
  As a user
  I want to answer some riddles

  Scenario: No selection by default
    Given I see a riddle
    Then no answer should be selected
    And I should see a message Please select an answer

  @javascript
  Scenario: Selection is confirmed
    Given I see a riddle
    When I select answer 2
    Then answer 2 should be shown as selected

  @javascript
  Scenario: Feedback on correct answer
    Given I see a riddle
    When I select the correct answer
    And I wait a little
    Then I should see a message Correct answer

  @javascript
  Scenario: Feedback on wrong answer
    Given I see a riddle
    When I select a wrong answer
    And I wait a little
    Then I should see a message Wrong answer


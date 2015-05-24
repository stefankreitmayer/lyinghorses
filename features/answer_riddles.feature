Feature: Answer riddles
  In order to learn and have fun
  As a user
  I want to answer some riddles

  Scenario: Change selection
    Given I see a riddle
    When I select the first answer
    Then the first answer should be shown as selected
    When I select the second answer
    Then the second answer should be shown as selected

  Scenario: Feedback on correct answer
    Given I selected the correct answer
    When the riddle closes
    Then I should see a message Your answer is correct


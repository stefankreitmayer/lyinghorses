Feature: Answer riddles
  In order to learn and have fun
  As a user
  I want to answer some riddles

  Scenario: No selection by default
    Given I see a riddle question
    Then no answer should be selected
    And I should see a message Please select an answer

  @javascript
  Scenario: Selection is confirmed
    Given I see a riddle question
    When I select answer 2
    Then answer 2 should be shown as selected

  @javascript
  Scenario: Feedback on correct answer
    Given I see a riddle question
    And I see my score
    When I select the correct answer
    And I wait 1 seconds
    Then my score should be higher than before
    When I wait 1 seconds
    Then I should see a different riddle question

  @javascript
  Scenario: Feedback on wrong answer
    Given I see a riddle question
    And I see my score
    When I select a wrong answer
    And I wait 1 seconds
    Then my score should be the same as before
    When I wait 1 seconds
    Then I should see a different riddle question

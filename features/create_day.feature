Feature: Create day
  Scenario: Starting a new day
    Given Bruna's timesheet
    And I am on Bruna's listing days page
    When I follow "New day"
    Then I should be on starting a new day on Bruna's page
    And I should see "Start new day"

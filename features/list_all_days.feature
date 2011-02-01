Feature: List all timesheets
  Scenario: No days have been created yet
    Given Bruna's timesheet
    And I am on Bruna's listing days page
    Then I should see "No days available."

  Scenario: One or more days available
    Given Bruna's timesheet
    And Bruna's day
    | arrival          | departure        |
    | 26-01-2011 10:00 | 26-01-2011 19:00 |
    And I am on Bruna's listing days page
    Then I should see "2011-01-26"

Feature: Show a timesheet
  Scenario: Showing a timesheet
    Given Bruna's timesheet
    And I am on list timesheets page
    When I follow "show_Bruna"
    Then I should be on Bruna's listing days page

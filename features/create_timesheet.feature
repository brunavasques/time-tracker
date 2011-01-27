Feature: Create a timesheet
  Scenario: Create a timesheet
    Given I am on create timesheet page
    When I fill in "timesheet_owner" with "Bruna"
    And I press "Create"
    Then I should be on Bruna's listing days page

  Scenario: Try to create a timesheet without name
    Given I am on create timesheet page
    When I press "Create"
    Then I should be on create timesheet page

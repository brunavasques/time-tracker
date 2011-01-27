Feature: List all timesheets
  Scenario: No timesheets have been created yet
    Given I am on list timesheets page
    Then I should see "No timesheets available."

  Scenario: One or more timesheets available
    Given Bruna's timesheet
    And Igor's timesheet
    And I am on list timesheets page
    Then I should see "Bruna"
    And I should see "Igor"

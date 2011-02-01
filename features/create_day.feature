Feature: Create day
  Scenario: Starting a new day
    Given Bruna's timesheet
    And I am on Bruna's listing days page
    When I follow "New day"
    Then I should be on starting a new day on Bruna's page
    And I should see "Start new day"

  Scenario: Saving a new day
    Given Bruna's timesheet
    And I am on starting a new day on Bruna's page
    When I fill in "day_arrival" with "26-01-2011 10:00"
    And I fill in "day_departure" with "26-01-2011 19:00"
    And press "Save"
    Then I should be on Bruna's listing days page

  Scenario: Try to create a day without arrival
    Given Bruna's timesheet
    And I am on starting a new day on Bruna's page
    And I fill in "day_departure" with "26-01-2011 19:00"
    And press "Save"
    Then I should be on starting a new day on Bruna's page

  Scenario: Try to create a day without departure
    Given Bruna's timesheet
    And I am on starting a new day on Bruna's page
    When I fill in "day_arrival" with "26-01-2011 10:00"
    And press "Save"
    Then I should be on starting a new day on Bruna's page

  Scenario: Try to create a day that already exists
    Given Bruna's timesheet
    And Bruna's day
    | arrival          | departure        |
    | 2011-01-26 10:00 | 2011-01-26 19:00 |
    And I am on starting a new day on Bruna's page
    When I fill in "day_arrival" with "26-01-2011 10:00"
    And I fill in "day_departure" with "26-01-2011 19:00"
    And press "Save"
    Then I should be on starting a new day on Bruna's page

  Scenario: Try to create a day with departure time earlier than arrival time
    Given Bruna's timesheet
    And I am on starting a new day on Bruna's page
    When I fill in "day_arrival" with "26-01-2011 19:00"
    And I fill in "day_departure" with "26-01-2011 10:00"
    And press "Save"
    Then I should be on starting a new day on Bruna's page

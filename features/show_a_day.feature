Feature: Show a day
  Scenario: Showing details of a day
    Given Bruna's timesheet
    And Bruna's day
    | arrival          | departure        |
    | 26-01-2011 10:00 | 26-01-2011 19:00 |
    And I am on Bruna's listing days page
    When I follow "show_2011-01-26"
    Then I should be on Bruna's "2011-01-26" day page
    And I should see "2011-01-26 10:00"
    And I should see "2011-01-26 19:00"
    And I should see "09:00"

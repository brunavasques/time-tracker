Given /^([^"]*)'s timesheet$/ do |timesheet_owner|
  Timesheet.create! :owner => timesheet_owner
end

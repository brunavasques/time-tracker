class Timesheet < ActiveRecord::Base
  validates_presence_of :owner
end

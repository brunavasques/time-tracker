class Timesheet < ActiveRecord::Base
  validates_presence_of :owner
  validates_uniqueness_of :owner
end

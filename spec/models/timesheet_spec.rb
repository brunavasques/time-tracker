require 'spec_helper'

describe Timesheet do
  it 'should have an owner' do
    timesheet = Timesheet.new
    timesheet.save.should be_false
    timesheet.owner = 'lala'
    timesheet.save.should be_true
  end
end

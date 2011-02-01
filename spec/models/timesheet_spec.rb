require 'spec_helper'

describe Timesheet do
  it 'should have an owner' do
    timesheet = Timesheet.new
    timesheet.save.should be_false
    timesheet.owner = 'lala'
    timesheet.save.should be_true
  end

  it 'should have an unique owner' do
    timesheet = Timesheet.create! :owner => "Bruna"
    timesheet = Timesheet.new
    timesheet.owner = "Bruna"
    timesheet.save.should be_false
  end
end

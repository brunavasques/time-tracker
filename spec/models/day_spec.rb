require 'spec_helper'

describe Day do
  let :day do
    Day.new
  end

  it 'should have arrival time' do
    day.departure = "19:00"
    day.save.should be_false
    day.arrival = "10:00"
    day.save.should be_true
  end

  it 'should have departure time' do
    day.arrival = "10:00"
    day.save.should be_false
    day.departure = "19:00"
    day.save.should be_true
  end

  it 'should not allow 2 days with same date' do
    Day.create! :arrival => "26-01-2011 10:00", :departure => "26-01-2011 19:00"
    day = Day.new
    day.arrival = "26-01-2011 10:00"
    day.departure = "26-01-2011 19:00"
    day.save.should be_false
  end

  it 'should not allow departure time earlier than arrival' do
    day.departure = "10:00"
    day.arrival = "19:00"
    day.save.should be_false
  end

  it 'should not allow lunchtime with arrival without departure time' do
    day.departure = "19:00"
    day.arrival = "10:00"
    day.lunchtime = "12:00"
    day.save.should be_false
    day.back_from_lunch = "13:00"
    day.save.should be_true
  end

  it 'should not allow lunchtime with departure without arrival time' do
    day.departure = "19:00"
    day.arrival = "10:00"
    day.back_from_lunch = "13:00"
    day.save.should be_false
    day.lunchtime = "12:00"
    day.save.should be_true
  end

  it 'should calculate the total worked time given arrival and departure time' do
    day.arrival = "10:00"
    day.departure = "19:30"
    worked_time = day.total_worked_time
    worked_time.should == "09:30:00"
  end

  it 'should calculate the total worked time given arrival, departure, lunch departure and lunch arrival time' do
    day.arrival = "10:00"
    day.departure = "19:21"
    day.lunchtime = "12:00"
    day.back_from_lunch = "13:00"
    worked_time = day.total_worked_time
    worked_time.should == "08:21:00"
  end

  it 'should calculate the total worked time given arrival, departure, lunch departure, lunch arrival time and other interval of time' do
    day.arrival = "10:00"
    day.departure = "19:21"
    day.lunchtime = "12:00"
    day.back_from_lunch = "13:00"
    day.other = "00:00:55"
    worked_time = day.total_worked_time
    worked_time.should == "08:20:05"
  end
end

class Day < ActiveRecord::Base
  belongs_to :timesheet
  validates_presence_of :arrival, :departure
  validates_presence_of :lunchtime, :if => "!back_from_lunch.nil?"
  validates_presence_of :back_from_lunch, :if => "!lunchtime.nil?"

  validate :uniqueness_of_date, :departure_cannot_be_earlier_than_arrival

  def uniqueness_of_date
    if arrival and departure
      date = arrival.to_s.split(" ")[0]
      unless (Day.where(:arrival => "#{date} 00:00".."#{date} 23:59")).empty?
        errors.add(:arrival, "date must be unique")
      end
    end
  end

  def departure_cannot_be_earlier_than_arrival
    if arrival and departure and departure < arrival
      errors.add(:arrival, "must be earlier than departure")
    end
  end

  def total_worked_time
    @total_time = departure - arrival if departure and arrival
    @total_time = @total_time - lunch_time
    @total_time = @total_time - other.hour*3600 - other.min*60 - other.sec if other

    #total_worked_time = fill_with_zero(hours) + ":" + fill_with_zero(mins) + ":" + fill_with_zero(secs)
    total_worked_time = "#{hours(@total_time)}:#{mins(@total_time)}:#{secs(@total_time)}"
  end

  def hours(time)
    fill_with_zero((time/3600).floor)
  end

  def mins(time)
    fill_with_zero(((time%3600)/60).floor)
  end

  def secs(time)
    fill_with_zero(((time%3600)%60).floor)
  end

  def lunch_time
    if lunchtime && back_from_lunch
      return back_from_lunch - lunchtime
    else
      return 0
    end
  end

  def formated_lunch_time
    time = lunch_time
    "#{hours(time)}:#{mins(time)}:#{secs(time)}"
  end

  def fill_with_zero(number)
    if number > 9
      number.to_s
    else
      "0"+number.to_s
    end
  end
end

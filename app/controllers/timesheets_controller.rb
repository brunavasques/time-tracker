class TimesheetsController < ApplicationController
  def new
    @timesheet = Timesheet.new
  end

  def create
    @timesheet = Timesheet.new(params[:timesheet])

    if @timesheet.save
      redirect_to "/timesheets/#{@timesheet.id}/days"
    else
      redirect_to :action => "new"
    end
  end
end

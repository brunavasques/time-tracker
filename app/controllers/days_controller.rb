class DaysController < ApplicationController
  def new
    @day = Day.new
  end
end

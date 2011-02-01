class DaysController < ApplicationController
  def index
    @days = Day.all
  end

  def new
    @day = Day.new
  end

  def create
    @day = Day.new(params[:day])

    if @day.save
      redirect_to :action => :index
    else
      redirect_to :action => :new
    end
  end

  def show
    @day = Day.find(params[:id])
  end
end

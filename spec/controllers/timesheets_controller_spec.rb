require 'spec_helper'

describe TimesheetsController do
  describe 'GET /timesheets/new' do
    it 'should create a new timesheet' do
      get :new
      assigns[:timesheet].should be
    end
  end

  describe 'POST /timesheet' do

    before :each do
      @owner = "Bruna"
      @valid_timesheet = mock_model(Timesheet, :owner => @owner, :id => 1)
    end

    it 'should create a timesheet with the given parameters' do
      Timesheet.should_receive(:new).with('owner' => @owner).and_return(@valid_timesheet)
      @valid_timesheet.should_receive(:save).once.and_return(true)
      valid_post_to_create_timesheet
    end

    it 'should save timesheet if parameters are valid' do
      Timesheet.stub!(:new).and_return(@valid_timesheet)
      @valid_timesheet.stub!(:save).and_return(true)
      valid_post_to_create_timesheet
      response.should redirect_to "/timesheets/#{@valid_timesheet.id}/days"
    end

    it 'should return error if parameters are invalid' do
      valid_post_to_create_timesheet ({:owner => ""})
      response.should redirect_to(:action => :new)
    end

  private
    def valid_post_to_create_timesheet(parameters = {})
      post :create, :timesheet =>
        {:owner => @owner}.merge(parameters)
    end
  end
end

class TimesheetsController < ApplicationController
  def index
    @timesheets = current_user.timesheets.order(clock_in: :desc)
  end

  def show
    @timesheet = current_user.timesheets.order(clock_in: :desc)
    # render partial: 'timesheet'
  end

  def create_clock_in_entry
    @timesheet = current_user.timesheets.create(clock_in: Time.now, clock_out: nil,date: Date.today)
    flash[:notice] = "Time sheet successfully updated!" if @timesheet.save
  end

  def create_clock_out_entry
    @last_clock_in = current_user.timesheets.last
    flash[:notice] = "Time sheet successfully updated!" if @last_clock_in.update(clock_out: Time.now)
  end
end

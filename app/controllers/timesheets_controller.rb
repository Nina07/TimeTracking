class TimesheetsController < ApplicationController
  def index
    @timesheets = current_user.timesheets
  end

  def show
  end

  def create_clock_in_entry
    @timesheet = current_user.timesheets.create(clock_in: Time.now, clock_out: nil,date: Date.today)
    if @timesheet.save
      flash[:notice] = "Time sheet successfully updated!"
      redirect_to timesheets_path
    else
    end
  end

  def create_clock_out_entry
    @last_clock_in = current_user.timesheets.last
    if @last_clock_in.update(clock_out: Time.now)
      flash[:notice] = "Time sheet successfully updated!"
    else
    end
  end
end

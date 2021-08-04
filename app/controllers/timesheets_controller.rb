class TimesheetsController < ApplicationController
  def index
    @timesheets = current_user.timesheets.order(clock_in: :desc)
  end

  def show
    @timesheet = current_user.timesheets.order(clock_in: :desc)
    @teacher = User.find(params[:id]) ? User.find(params[:id]) : User.find(params[:user_id])
  end

  def edit
    @teacher = User.find(params[:id])
  end

  def create_clock_in_entry
    if current_user.timesheets.last.clock_out != nil
      @timesheet = current_user.timesheets.create(clock_in: Time.now, clock_out: nil,date: Date.today)
      if @timesheet.save
        flash[:notice] = "Time sheet successfully updated!"
        redirect_to user_path(current_user)
      end
    else
      flash[:notice] = "You have not clocked out from last time yet. Clock out first to create a new entry."
    end
  end

  def create_clock_out_entry
    @last_clock_in = current_user.timesheets.last
    if @last_clock_in.update(clock_out: Time.now)
      flash[:notice] = "Time sheet successfully updated!"
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @timesheet = Timesheet.find(params[:id])
    @timesheet.destroy
    # redirect_to timesheet_path()
  end
end

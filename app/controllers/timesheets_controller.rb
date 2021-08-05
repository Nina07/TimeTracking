class TimesheetsController < ApplicationController
  before_action :set_timesheet, only: [:edit, :update, :destroy]

  def index
    @timesheets = current_user.timesheets.order(clock_in: :desc)
  end

  def show
    @timesheet = current_user.timesheets.order(clock_in: :desc)
    @teacher = User.find(params[:id]) ? User.find(params[:id]) : User.find(params[:user_id])
  end

  def edit
  end

  def update
    timesheet_params[:clock_in].blank? ? timesheet_params[:clock_in] = @timesheet.clock_in : timesheet_params[:clock_in].to_datetime
    timesheet_params[:clock_out].blank? ? timesheet_params[:clock_out] = @timesheet.clock_out : timesheet_params[:clock_out].to_datetime

    if @timesheet.update(timesheet_params)
      flash[:notice] = "Timesheet detail updated successfully!"
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def create_clock_in_entry
    if !timesheet_present? || timesheet_present? && !last_timesheet_entry
      @timesheet = current_user.timesheets.create(clock_in: Time.now, clock_out: nil, date: Date.today)
      flash[:notice] = "Time sheet successfully updated!"
    else
      flash[:notice] = "You have not clocked out from last time yet. Clock out first to create a new entry."
    end
    redirect_to user_path(current_user)
  end

  def create_clock_out_entry
    if last_timesheet_entry.clock_out.nil?
      last_timesheet_entry.update(clock_out: Time.now)
      flash[:notice] = "Time sheet successfully updated!"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Your last clock out is already uo to date!"
    end
  end

  def destroy
    @timesheet = Timesheet.find(params[:id])
    if @timesheet.destroy
      flash[:notice] = "Deleted successfully"
      redirect_to user_path(current_user)
    end
  end

  private
  def timesheet_params
    params.require(:timesheet).permit(:clock_in, :clock_out)
  end

  def set_timesheet
    @timesheet = Timesheet.find(params[:id])
  end

  def timesheet_present?
    current_user.timesheets.present?
  end

  def last_timesheet_entry
    current_user.timesheets.last
  end
end

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @last_timesheet = User.all.map {|user| user.timesheets.last}
    @current_user_timesheets = Timesheet.where(user_id: current_user.id)
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
  end

  def destroy
  end
end

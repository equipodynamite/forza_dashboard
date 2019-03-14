class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  def index
    @start_date = params[:start_date]
    @start_date = format_time(@start_date, Time.now.beginning_of_week)

    @end_date = params[:end_date]
    @end_date = format_time(@end_date, Time.now.end_of_week)

    # if current_user.has_role? :member
      @attendances = current_user.attendances.group_by_period(
        :day_of_week, :date, range: @start_date..@end_date, format: "%a").count

      @attendances_count = @attendances.sum{ |k, v| v }
    #else
      @all_attendances = Attendance.all

      @monthly_attendances = @all_attendances.group_by_period(
        :month, :date, range: @start_date..@end_date
      ).count

      @weekly_attendances = @all_attendances.group_by_period(
        :month, :date, range: 2.years.ago..Time.now
      ).count

      @day_of_week_attendances = @all_attendances.group_by_period(
        :day_of_week, :date, range: @start_date..@end_date, format: "%a").count

      @avg_attendances = average_attendances_by_user
  #  end

  end

  def new
    @attendance = Attendance.new
  end

  def create
    new_params =  attendance_params.clone
    new_params[:date] = format_time(new_params[:date], Time.now)
    @attendance = Attendance.new(new_params)
    respond_to do |format|
      if @attendance.save
        format.html {redirect_to request.referrer, notice: 'Attendance was successfully created.' }
        format.json { render :show, status: :created, location: @attendance }
      else
        format.html { render :new }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to @attendance, notice: 'Attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { render :edit }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to attendances_url, notice: 'Attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def average_attendances_by_user
      average_attendances = Hash.new(0)
      range_weeks = ((@end_date - @start_date) / 1.week).round
      User.all.each do |user|
        average_attendances[user.attendances.where(date:@start_date..@end_date).count / range_weeks] += 1
      end
      return average_attendances
    end

    def format_time(time, default_value)
      if time.nil?
        time = default_value
      else
        time = Time.strptime(time, "%m/%d/%Y")
      end
    end

    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    def attendance_params
      params.fetch(:attendance, {}).permit(:date, :user_id)
    end
end

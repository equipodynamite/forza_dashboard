class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  # GET /attendances
  # GET /attendances.json
  def index
    # @select_options = {
    #   semana: :day_of_week,
    #   mes: :day_of_month,
    #   año: :month_of_year
    # }
    # @time_period = params[:time_period] || :semana

    @start_date = params[:start_date]
    if @start_date.nil?
      @start_date = Time.now.beginning_of_week
    else
      @start_date = Time.strptime(@start_date, "%m/%d/%Y")
    end

    @end_date = params[:end_date]
    if @end_date.nil?
      @end_date = Time.now.end_of_week
    else
      @end_date = Time.strptime(@end_date, "%m/%d/%Y")
    end

    @attendances = current_user.attendances
    @attendances = @attendances.group_by_period(:day_of_week, :date, range: @start_date..@end_date, format: "%a").count
    puts @attendances
    @attendances_count = @attendances.sum{ |k, v| v }
  end


  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = Attendance.new(attendance_params)

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to @attendance, notice: 'Attendance was successfully created.' }
        format.json { render :show, status: :created, location: @attendance }
      else
        format.html { render :new }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendances/1
  # PATCH/PUT /attendances/1.json
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

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to attendances_url, notice: 'Attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.fetch(:attendance, {})
    end
end

class Admin::DashboardController < DashboardController
    layout "user_dashboard"
    before_action :is_admin?

    def index
    end
  
    def attendance
      @start_date = params[:start_date]
      @start_date = TimeFormat.from_american_date(@start_date, Time.now.beginning_of_week)
  
      @end_date = params[:end_date]
      @end_date = TimeFormat.from_american_date(@end_date, Time.now.end_of_week)
      @all_attendances = Attendance.all
      @filtered_attendances = @all_attendances.group_by_period(
        :day_of_week, :date, range: @start_date..@end_date, format: "%a").count
  
      @filtered_attendances_count = @filtered_attendances.sum{ |k, v| v }
    end
  
    def payments
      @payment_log = current_user.payments
    end

    private

    def is_admin?
      current_user.has_role? :admin
    end
  end
  
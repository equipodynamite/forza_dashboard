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

      @all_attendances = Attendance.all.order("date DESC")

      @filtered_attendances = @all_attendances.group_by_period(
        :day_of_week, :date, range: @start_date..@end_date, format: "%a").count

      @attendances_count = @filtered_attendances.sum{ |k, v| v }

      @monthly_attendances = @all_attendances.group_by_period(
        :month, :date, range: @start_date..@end_date
      ).count

      @weekly_attendances = @all_attendances.group_by_period(
        :month, :date, range: 2.years.ago..Time.now
      ).count

      @day_of_week_attendances = @all_attendances.group_by_period(
        :day_of_week, :date, range: @start_date..@end_date, format: "%a").count

      @avg_attendances = average_attendances_by_user
    end

    def payments
      @start_date = params[:start_date]
      @start_date = TimeFormat.from_american_date(@start_date, Time.now.beginning_of_month)

      @end_date = params[:end_date]
      @end_date = TimeFormat.from_american_date(@end_date, Time.now.end_of_month)

      @all_payments = Payment.all.order('date DESC')
    end

    def average_attendances_by_user
      average_attendances = Hash.new(0)
      range_weeks = ((@end_date - @start_date) / 1.week).round
      return 0 if range_weeks.zero?
      User.all.each do |user|
        average_attendances[user.attendances.where(date:@start_date..@end_date).count / range_weeks] += 1
      end
      return average_attendances
    end


    private

    def is_admin?
      current_user.has_role? :admin
    end
  end

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

      @monthly_payments = @all_payments.group_by_period(
          :month, :date, range: @start_date..@end_date
        ).count

      @monthly_payments_count = @monthly_payments.sum{ |k, v| v }

      @weekly_payments_all = @all_payments.group_by_period(
        :week, :date, range: Time.now.beginning_of_year..Time.now
      ).count

      @payments_graph = @all_payments.group_by_period(
        :day_of_week, :date, range: @start_date..@end_date, format: "%a").count

    end

    def finances
      @start_date = params[:start_date]
      @start_date = TimeFormat.from_american_date(@start_date, 1.year.ago)
      @end_date = params[:end_date]
      @end_date = TimeFormat.from_american_date(@end_date, Time.now.end_of_month)
      @month = @start_date.beginning_of_month
      @users_per_month = {}
      months = 0
      while @month < @end_date do
        @users_per_month[@month.to_date] = User.where('created_at<? AND (last_active_date<? OR last_active_date IS NULL)', @month, @month).count
        @month = @month + 1.month
      end
      @cancellations_per_month = User.all.group_by_period(:month, :last_active_date, range: @start_date..@end_date).count

      @churn_rate = @cancellations_per_month.map{|x, y| [x, @users_per_month[x].zero? ? 0 : y/(@users_per_month[x] + 0.0)]}.to_h
      @avg_lifetime = @churn_rate.map{|x, y| [x, y.zero? ? 10 : 1/(y+0.0)]}.to_h
      @avg_lifetime_value = @avg_lifetime.map{|x, y| [x, y*12*800]}.to_h
      @money_per_month = @users_per_month.map{|x, y| [x, y*800]}.to_h
      total_money = @money_per_month.map{|x, y| y}.sum
      avg_weekly_value = 220# money
      @avg_customer_lifetime = @avg_lifetime.map{|x, y| y}.sum()/(@avg_lifetime.count + 0.0)
      @lifetime_value = 12 * 220 * @avg_customer_lifetime

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

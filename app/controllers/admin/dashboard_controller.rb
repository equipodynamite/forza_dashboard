class Admin::DashboardController < DashboardController
    layout "user_dashboard"
    before_action :is_admin?

    def index
    end

    def attendance
      @attendance_service = AttendanceService.new(params)
    end

    def payments
      @start_date = params[:start_date]
      @start_date = TimeFormat.from_american_date(@start_date, Time.now.beginning_of_month)

      @end_date = params[:end_date]
      @end_date = TimeFormat.from_american_date(@end_date, Time.now.end_of_month)

      @all_payments = Payment.all.order('created_at DESC')

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
      @avg_lifetime_value = @avg_lifetime.map{|x, y| [x, y*800]}.to_h
      @money_per_month = @users_per_month.map{|x, y| [x, y*800]}.to_h
      total_money = @money_per_month.map{|x, y| y}.sum
      avg_weekly_value = 220# money
      @avg_customer_lifetime = @avg_lifetime.map{|x, y| y}.sum()/(@avg_lifetime.count + 0.0)
      @lifetime_value = @avg_lifetime_value.map{|x, y| y}.sum/(@avg_lifetime_value.count + 0.0)

    end

    def member_progress
      member_id = user_id_from_username(params[:username])
      if member_id
        @member = User.find(member_id)
        physical_tests = @member.physical_tests
        build_progress_data(physical_tests)
        populate_progress_data(physical_tests)
      end
    end

    def behavior
      @start_date = params[:start_date]
      @start_date = TimeFormat.from_american_date(@start_date, 1.year.ago)
      @end_date = params[:end_date]
      @end_date = TimeFormat.from_american_date(@end_date, Time.now.end_of_month)
      @month = @start_date.beginning_of_month
      @users_per_month = {}
      @cumulative_users_per_month = {}
      @membership_growth = {}
      months = 0
      acum = 0

      while @month < @end_date do
        @users_per_month[@month.to_date] = User.where(created_at: @month..@month.end_of_month).count
        growth = 0

        if acum != 0 then
          @last_month = @month - 1.month
          growth = @users_per_month[@month.to_date] - @users_per_month[@last_month.to_date]
          if @users_per_month[@last_month.to_date] == 0 then
            growth = @users_per_month[@month.to_date]
          else
            growth /= @users_per_month[@last_month.to_date]
          end
        end

        @membership_growth[@month.to_date] = growth

        @cumulative_users_per_month[@month.to_date] = @users_per_month[@month.to_date] + acum
        acum = @cumulative_users_per_month[@month.to_date]
        @month = @month + 1.month
        months += 1
      end

      @new_memberships_per_month = 1.0*acum/months

      @cancellations_per_month = User.all.group_by_period(:month, :last_active_date, range: @start_date..@end_date).count

    end

    def member_index
      @members = User.all.with_role :member
    end

    def build_progress_data(physical_tests)
      @info = [{name: "push ups", data: {}},
               {name: "pull ups", data: {}},
               {name: "squats", data: {}},
               {name: "crunches", data: {}}]
    end

    def populate_progress_data(physical_tests)
      physical_tests.each do |test|
        date = test.created_at.to_date
        @info[0][:data][date] = test.push_ups
        @info[1][:data][date] = test.pull_ups
        @info[2][:data][date] = test.squats
        @info[3][:data][date] = test.crunches
      end
    end

    private

    def user_id_from_username(username)
      user = User.find_by(username: username)
      return (!user.nil?) ? user.id : nil
    end

    def is_admin?
      current_user.has_role? :admin
    end
  end

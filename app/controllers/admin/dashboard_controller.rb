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

    def average_attendances_by_user
      average_attendances = Hash.new(0)
      range_weeks = ((@end_date - @start_date) / 1.week).round
      return 0 if range_weeks.zero?
      User.all.each do |user|
        average_attendances[user.attendances.where(date:@start_date..@end_date).count / range_weeks] += 1
      end
      return average_attendances
    end

    def member_progress
      members_ids = PhysicalTest.pluck(:user_id).uniq
      params[:current_member_id] ||= members_ids.empty? ? User.last.id : members_ids.first
      @members = User.find(members_ids).pluck(:username, :id)
      @current_member = User.find(params[:current_member_id])
      member_physical_tests = PhysicalTest.where(user_id: params[:current_member_id]).limit(10)
      @info = []
      @info << {name: "push ups", data: {}}
      @info << {name: "pull ups", data: {}}
      @info << {name: "squats", data: {}}
      @info << {name: "crunches", data: {}}
      member_physical_tests.map do |pt|
        pt_date = pt.created_at.to_date
        @info[0][:data][pt_date] = pt.push_ups
        @info[1][:data][pt_date] = pt.pull_ups
        @info[2][:data][pt_date] = pt.squats
        @info[3][:data][pt_date] = pt.crunches
      end
    end


    private

    def is_admin?
      current_user.has_role? :admin
    end
  end

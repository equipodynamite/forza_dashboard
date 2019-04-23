class Members::DashboardController < DashboardController
    layout "user_dashboard"
    before_action :is_member?

    def index
    end

    def attendance
      @start_date = params[:start_date]
      @start_date = TimeFormat.from_american_date(@start_date, Time.now.beginning_of_week)

      @end_date = params[:end_date]
      @end_date = TimeFormat.from_american_date(@end_date, Time.now.end_of_week)
      @all_attendances = current_user.attendances.order("created_at DESC")
      @filtered_attendances = @all_attendances.group_by_period(
        :day_of_week, :date, range: @start_date..@end_date, format: "%a").count

      @filtered_attendances_count = @filtered_attendances.sum{ |k, v| v }
    end

    def payments      
      @all_payments = current_user.payments.order('created_at DESC')
      @next_payment_due = next_due_date(@all_payments)
    end

    def member_progress
      member_physical_tests = PhysicalTest.where(user_id: current_user.id).limit(10)
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

    def is_member?
      current_user.has_role? :member
    end

    def next_due_date(payments)
      (!payments.empty?) ? payments.first.date.to_date + 1.month : nil
    end
  end

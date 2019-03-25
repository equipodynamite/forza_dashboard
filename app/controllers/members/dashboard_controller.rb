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
      @all_attendances = current_user.attendances
      @filtered_attendances = @all_attendances.group_by_period(
        :day_of_week, :date, range: @start_date..@end_date, format: "%a").count
  
      @filtered_attendances_count = @filtered_attendances.sum{ |k, v| v }
    end
  
    def payments
      @all_payments = current_user.payments.order('date DESC')
      @next_payment_due = next_due_date(@all_payments)
    end

    private

    def is_member?
      current_user.has_role? :member
    end

    def next_due_date(payments)
      (!payments.empty?) ? payments.first.date.to_date + 1.month : nil
    end
  end
  
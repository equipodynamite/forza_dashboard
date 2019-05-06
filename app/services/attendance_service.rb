class AttendanceService
    attr_reader :start_date, :end_date, :all_attendances, :attendances_count, :avg_attendances
    def initialize(params)
      @start_date = TimeFormat.from_american_date(params[:start_date], Time.now.beginning_of_week)
      @end_date = TimeFormat.from_american_date(params[:end_date], Time.now.end_of_week)
      @all_attendances = Attendance.all.order("created_at DESC")
      @attendances_count = filtered_attendances.sum{ |k, v| v }
      @avg_attendances = average_attendances_by_user
    end

    def filtered_attendances
        @filtered_attendances ||= @all_attendances.group_by_period(:day_of_week,
                                                                   :date,
                                                                   range: @start_date..@end_date,
                                                                   format: "%a").count
    end
    
    def monthly_attendances
        @monthly_attendances ||= @all_attendances.group_by_period(:month,
                                                                  :date, 
                                                                  range: @start_date..@end_date).count
    end

    def weekly_attendances
        @weekly_attendances ||= @all_attendances.group_by_period(:month,
                                                                  :date,
                                                                  range: 2.years.ago..Time.now ).count
    end

    def day_of_week_attendances
        @day_of_week_attendances ||= @all_attendances.group_by_period(:day_of_week,
                                                                      :date,
                                                                      range: @start_date..@end_date, 
                                                                      format: "%a").count
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
end
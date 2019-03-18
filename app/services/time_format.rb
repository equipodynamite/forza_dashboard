class TimeFormat
    def self.american_date(date, default_date)
        return (date.nil?) ? default_date : to_american_date(date)
    end

    private
    
    def to_american_date(date)
        Time.strptime(date, "%m/%d/%Y")
    end
end
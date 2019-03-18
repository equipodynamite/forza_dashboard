class TimeFormat
    def self.from_american_date(date, default_date)
        return (date.nil?) ? default_date : from_american_date_text(date)
    end

    def self.to_american_date(date)
        date.strftime("%m/%d/%Y")
    end

    def self.to_mexican_date(date)
        date.strftime("%d/%m/%Y")
    end

    def self.day_of_week_spanish(date)
        DAYS_IN_SPANISH[date.wday]
    end

    private
    DAYS_IN_SPANISH = %W(Domingo Lunes Martes Miércoles Jueves Viernes Sábado)
    
    def self.from_american_date_text(american_date)
        Time.strptime(american_date, "%m/%d/%Y" )
    end
end
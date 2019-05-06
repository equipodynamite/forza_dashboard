module PaymentsHelper
    PAYMENT_CLASSES = { "on_time": '-on-time', "late": "-late" }
    PAYMENT_STATUS_VALUE = { "on_time": "A tiempo", "late": "Tarde" }
    def payment_amount(amount)
        return "$#{amount}"
    end

    def payment_status(status)
        print(status.status)
        payment_class = "payment-status#{PAYMENT_CLASSES[status]}"
        puts("<td class='#{payment_class}'>#{PAYMENT_STATUS_VALUE[status]}</td>")
        return "<td class='#{payment_class}'>#{PAYMENT_STATUS_VALUE[status]}</td>".html_safe
    end
end

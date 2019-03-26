module MembersDashboardHelper
    def render_all_payments
        if @all_payments.empty?
            html_content = "<p class='text-muted text-center'>No hay pagos registrados</p>"
            return html_content.html_safe
        else
            render "members/payments/payments_table"
        end
    end

    def payment_due_date
        (!@next_payment_due.nil?) ? has_due_date(@next_payment_due) : no_due_date
    end

    private

    def has_due_date(due_date)
        "Siguiente fecha de corte: #{TimeFormat.to_mexican_date(due_date)}"
    end

    def no_due_date
        "No tienes fecha de corte pendiente."
    end
end
module AdminDashboardHelper
    def render_all_admin_payments
        if @all_payments.empty?
            html_content = "<p class='text-muted text-center'>No hay pagos registrados</p>"
            return html_content.html_safe
        else
            render "admin/payments/payments_table"
        end
    end
end
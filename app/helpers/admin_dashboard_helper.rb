module AdminDashboardHelper
    def render_all_admin_payments
        if @all_payments.empty?
            html_content = "<p class='text-muted text-center'>No hay pagos registrados</p>"
            return html_content.html_safe
        else
            render "admin/payments/payments_table"
        end
    end

    def format_member_active(status)
        if status
            "<td class='member-active'>Activo</td>".html_safe
        else
            "<td class='member-inactive'>Inactivo</td>".html_safe
        end
    end

    def toggle_status_button(user)
        if user.active
            "<td classy'member-deactivate'>#{link_to('Desactivar', toggle_member_status_path(user), method: :put,  class: 'table-btn btn btn-danger')}</td>".html_safe 
        else
            "<td classy'member-deactivate'>#{link_to('Activar', toggle_member_status_path(user), method: :put,  class: 'table-btn btn btn-success')}</td>".html_safe 
        end
    end
end
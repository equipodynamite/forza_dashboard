module NavbarHelper
    def admin_badge
        (current_user.has_role? :admin ) ? admin_badge_html : ''
    end

    private

    def admin_badge_html
       return '<span class="badge badge-success">admin</span>'.html_safe
    end
end
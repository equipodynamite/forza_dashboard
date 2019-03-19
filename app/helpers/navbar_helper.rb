module NavbarHelper
    def render_navbar
        render "layouts/navbar" if user_signed_in?
    end

    def admin_badge
        (current_user.has_role? :admin ) ? admin_badge_html : ''
    end

    def nav_link_classes(current_path)
        base_class = "nav-link"
        (current_page?(current_path)) ? "#{base_class} active" : base_class
    end

    private

    def admin_badge_html
       return '<span class="badge badge-success">admin</span>'.html_safe
    end
end
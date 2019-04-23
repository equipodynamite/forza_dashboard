module SidebarHelper
  def admin_links
    (current_user.has_role? :admin) ? admin_links_html : ''
  end

  private

  def admin_links_html
    "<li class='nav-item'>
      #{link_to admin_dashboard_physical_tests_new_path, class: 'nav-link' do
        "<span><i class='fe fe-heart-o'></i></span>
        Prueba Física".html_safe
      end}
    </li>".html_safe
  end
end

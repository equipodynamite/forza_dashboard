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
    </li>
    <li class='nav-item'>
      #{link_to admin_dashboard_finances_path, class: 'nav-link' do
        "<span><i class='fe fe-money'></i></span>
        Finanzas".html_safe
      end}
    </li>
    <li class='nav-item'>
      #{link_to admin_dashboard_behavior_path, class: 'nav-link' do
        "<span><i class='fe fe-bolt'></i></span>
        Comportamiento".html_safe
      end}
    </li>
    <li class='nav-item'>
    #{link_to admin_dashboard_members_path, class: 'nav-link' do
      "<span><i class='fe fe-users'></i></span>
      Miembros".html_safe
      end}
    </li>
    ".html_safe
  end
end

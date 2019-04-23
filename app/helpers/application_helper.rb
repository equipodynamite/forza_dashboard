module ApplicationHelper
    ALERT_CLASSES = { 'success': 'success',
                      'notice': 'primary',
                      'error': 'danger',
                      'alert': 'warning'}

    def full_title(page_title = '')
        base_title = "Forza Gravity Gym"
        if page_title.empty?
            base_title
        else
            "#{page_title} | #{base_title}"
        end
    end

    def flash_type_to_alert_class(flash_type)
        ALERT_CLASSES[flash_type.to_sym]
    end
end

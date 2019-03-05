module DeviseHelper
    def devise_error_messages!
      return '' if resource.errors.empty? && flash.empty?
      flash_messages = read_flash_messages
      error_messages = resource.errors.full_messages
      message_list = (flash_messages + error_messages).map { |msg| content_tag(:li, msg) }
      html = build_messages_html(message_list)
    end

    private

    def read_flash_messages
        flash_alerts = []
        if !flash.empty?
            flash_alerts.push(flash[:error]) if flash[:error]
            flash_alerts.push(flash[:alert]) if flash[:alert]
            flash_alerts.push(flash[:notice]) if flash[:notice]
        end
        flash_alerts
    end

    def build_messages_html(message_list)
        messages = message_list.join
        puts(messages.inspect)
        html = <<-HTML
        <div class="alert alert-warning alert-dismissible sign-in-form-element" role="alert">
        <button type="button" class="close" data-dismiss="alert">
            <span aria-hidden="true">&times;</span>
        </button>
        #{messages}
        </div>
        HTML

        html.html_safe
    end
  end
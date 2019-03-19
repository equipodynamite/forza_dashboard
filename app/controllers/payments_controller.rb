class PaymentsController < ApplicationController
  def index
    @payments = current_user.payments.order('date DESC')

    if @payments.length == 0
        @next_payment = "No tienes fecha de corte pendiente"
    else
        @most_recent_date = @payments.first.date.to_date + 1.month
    end
  end
end

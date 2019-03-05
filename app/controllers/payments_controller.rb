class PaymentsController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  def index
    @payments = current_user.payments.order('date DESC')

    if @payments.length == 0
        @next_payment = "No tienes fecha de corte pendiente"
    else
        @most_recent_date = @payments.first.date.to_date + 1.month
        @next_payment ='Tu fecha de corte es en ' +  @most_recent_date.to_s
    end
  end

  def create

  end

  def update

  end

  def destroy

  end

  private

end

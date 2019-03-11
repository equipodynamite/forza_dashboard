class Users::DashboardController < ApplicationController
  layout "user_dashboard"

  def index
  end

  def attendance
    @attendance_record = current_user.attendances
  end

  def payments
    @payment_log = current_user.payments
  end
end

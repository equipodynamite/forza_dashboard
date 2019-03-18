class DashboardController < ApplicationController
  layout "user_dashboard"
  before_action :authenticate_user!

  def index
  end

  def attendance
  end

  def payments
  end

end

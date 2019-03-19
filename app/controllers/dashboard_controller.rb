class DashboardController < ApplicationController
  layout "user_dashboard"
  before_action :authenticate_user!
end

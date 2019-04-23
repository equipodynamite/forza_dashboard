class PassthroughController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_to_role_dashboard!

  def index
  end

  def attendance
  end

  def payments
  end

  def member_progress
  end

  private

  def redirect_to_role_dashboard!
    redirect_to :controller => resolve_target_controller,
                :action => action_name
  end

  def resolve_target_controller
    target_namespace = (current_user.has_role? :admin) ? "admin" : "members"
    "#{target_namespace}/dashboard"
  end
end

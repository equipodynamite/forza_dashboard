class UsersController < ApplicationController
  def search_member
    @matching_users = User.where('username LIKE ?', "%#{params[:q]}%").with_role :member
    render json: @matching_users
  end
end

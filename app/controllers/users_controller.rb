class UsersController < ApplicationController
  before_action :is_admin?, only: :toggle_user_active

  def search_member
    @matching_users = User.where('username LIKE ?', "%#{params[:q]}%").with_role :member
    render json: @matching_users
  end

  def toggle_user_active
    user = User.find(params[:id])
    respond_to do |format|
      if change_user_activity(user)
        flash[:success] = 'El estado del usuario fue cambiado exitosamente.'
        format.html { redirect_to request.referrer}
      else
        flash[:error] = 'No se pudo cambiar el estado del usuario.'
        format.html { redirect_to request.referrer }
      end
    end
  end


  private

  def change_user_activity(user)
    user.last_active_date = (user.active) ? Date.today : nil
    user.active = !user.active
    user.save
  end

  def is_admin?
    current_user.has_role? :admin
  end
end

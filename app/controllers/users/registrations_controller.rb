class Users::RegistrationsController < Devise::RegistrationsController
  
  def update
    super do |resource|
      if params[:user][:password].blank?
        current_user.update(user_params_no_password)
      else
        current_user.update(user_params)
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def user_params_no_password
    params.require(:user).permit(:username, :email)
  end
end

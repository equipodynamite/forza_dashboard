class ApplicationController < ActionController::Base
	before_action :configure_sign_up_params, if: :devise_controller?

	protected

	def configure_sign_up_params
		parameter_keys = [
			:username,
			:email,
			:password,
			:password_confirmation,
			:remember_me,
			:membership_id
		]
		devise_parameter_sanitizer.permit(:sign_up, keys: parameter_keys)
		devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password])
	end
end

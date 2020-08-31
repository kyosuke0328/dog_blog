class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	def after_sign_in_path_for(resource)
    root_path # ログイン後に遷移するpath
  end
	def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email, :profile_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:profile_image, :introduction, :name])
  end
end

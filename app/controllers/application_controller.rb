class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected
  def configure_permitted_parameters
    added_attrs = [ :nick_name, :profile, :image, :email, :password, :password_confirmation　]
    devise_parameter_sanitizer.permit(:sign_up, keys: [added_attrs])
    devise_parameter_sanitizer.permit(:account_update, keys: [added_attrs])
    devise_parameter_sanitizer.permit(:sign_in, keys: [added_attrs])
  end
end
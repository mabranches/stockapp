class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  before_filter :configure_permitted_exception_parameters, if: :devise_controller?

  protected
  def configure_permitted_exception_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
        user.permit(:name, :email, :password, :password_confirmation, :avatar)
    end

    devise_parameter_sanitizer.permit(:account_update) do |user|
        user.permit(:name, :email, :password, :current_password, :avatar)
    end

end

end

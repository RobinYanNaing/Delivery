class ApplicationController < ActionController::Base

  before_action :configer_permitted_parameters, if: :devise_controller?
  protected

    def configer_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :username , :birthday, :email, :password, :remember_me)}
      devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit( :email, :password, :remember_me)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :username , :birthday, :about, :email, :password, :remember_me)}
    end
end

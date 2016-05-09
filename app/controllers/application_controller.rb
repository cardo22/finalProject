class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :sign_up_permitted_perameters, if: :devise_controller?
  before_action :login_permitted_parameters, if: :devise_controller?
  before_action :profile_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    '/log_in/pin'# <- Path you want to redirect the user to.
  end
  protected

  def sign_up_permitted_perameters
  	devise_parameter_sanitizer.for(:sign_up).push(:first_name, :last_name, :card_number, :login_pin)
  end

  def login_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_in).push(:login_pin)
  end

  def profile_permitted_parameters
  	devise_parameter_sanitizer.for(:account_update).push(:nick_name)
  end
end

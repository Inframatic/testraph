class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :password) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :avatar, :avatar_cache, :remove_avatar, :confirmable) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :avatar, :current_password) }
  end


end
